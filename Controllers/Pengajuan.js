import { compare } from "bcrypt";
import db from "../Config/Db.js";

// pakai untuk admin get semua data pengajuan
export const getAllPengajuan = async (req, res) => {
  try {
    const query = await db.execute(
      `SELECT users.nama, users.no_telepon, pengajuan.id,pengajuan.tanggal, pengajuan.deskripsi, pengajuan.nominal, pengajuan.bukti, pengajuan.status, pengajuan.deskripsi_status, kriteria.jenis_bantuan
FROM pengajuan
INNER JOIN users ON users.id = pengajuan.id_users
INNER JOIN kriteria ON pengajuan.id_kriteria = kriteria.id
WHERE pengajuan.is_Deleted = 0;`
    );
    const pengajuan = query[0];
    return res.status(200).json({ success: true, data: pengajuan });
  } catch (error) {
    console.error("Terjadi kesalahan:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};

// pakai untuk karyawan nge get berdasarkan user yg sedang login
export const getPengajuanByUsers = async (req, res) => {
  try {
    const query = await db.execute(
      `SELECT pengajuan.id, pengajuan.tanggal, pengajuan.nominal, 
      kriteria.jenis_bantuan, pengajuan.deskripsi, pengajuan.bukti_transfer, 
      pengajuan.status, pengajuan.deskripsi_status 
      FROM pengajuan INNER JOIN users ON users.id = pengajuan.id_users 
      INNER JOIN kriteria ON pengajuan.id_kriteria = kriteria.id 
      WHERE pengajuan.is_Deleted = 0 AND pengajuan.id_users = ?;`,
      [req.user.id]
    );
    const pengajuan = query[0];
    return res.status(200).json({ success: true, data: pengajuan });
  } catch (error) {
    console.error("Terjadi kesalahan:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};

// get pengajuan berdasarkan id pengajuan - bisa digukan untuk edit per id
export const getPengajuanById = async (req, res) => {
  const { id } = req.params;
  try {
    const query = await db.execute(
      `SELECT * FROM pengajuan where is_Deleted = 0 AND id = ?`,
      [id]
    );
    const pengajuan = query[0];
    return res.status(200).json({ success: true, data: pengajuan });
  } catch (error) {
    console.error("Terjadi kesalahan:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};

// tambah pengajuan dari karyawan
export const pengajuan = async (req, res) => {
  const { tanggal, nominal, deskripsi, id_kriteria, bukti, id_users } =
    req.body;

  try {
    if (req.file === undefined) {
      return res.status(400).json({ msg: "No file uploaded" });
    }

    const { filename: bukti, size } = req.file;

    const fileSize = size;
    const imageUrl = `${process.cwd()}\\bukti\\${bukti}`;
    if (fileSize > 5000000) {
      return res.status(422).json({ msg: "Image must be smaller than 5MB" });
    }

    // Cek apakah pengguna sudah mengajukan sebelumnya
    const existingPengajuan = await db.execute(
      "SELECT * FROM pengajuan WHERE id_users = ? AND id_kriteria = ? AND is_Deleted = 0 ORDER BY tanggal DESC LIMIT 1",
      [id_users, id_kriteria]
    );

    // jika telah mengajukan sebelumnya masuk ke if ini
    if (existingPengajuan[0].length > 0) {
      // Inisilisasi variabel jenisBantuanSekarang = id_kriteria
      const jenisBantuanSekarang = id_kriteria;

      // Cek apakah jenis bantuan sama
      if (jenisBantuanSekarang == existingPengajuan[0][0].id_kriteria) {
        // jika sama akan masuk ke if ini untuk mengecek lama batas waktu cooldownnya
        const batasWaktuValue = await db.execute(
          `SELECT kriteria.batas_waktu FROM pengajuan INNER JOIN users ON users.id = pengajuan.id_users INNER JOIN kriteria ON pengajuan.id_kriteria = kriteria.id WHERE kriteria.id = ? LIMIT 1;`,
          [jenisBantuanSekarang]
        );

        // masukan jumlah waktu nya
        const cooldownWaktu = batasWaktuValue[0][0].batas_waktu; // Misalnya cooldown waktu dalam hari

        const waktuPengajuanSebelumnya = new Date(
          existingPengajuan[0][0].tanggal
        );
        const waktuCooldown = new Date();
        // kurangin Waktu cooldown dengan Waktu pengajuan sebelumnya
        waktuCooldown.setDate(waktuCooldown.getDate() - cooldownWaktu);

        // Jika waktu pengajuan sebelumnya lebih besar dari waktu cooldown,
        // artinya pengajuan masih dalam masa cooldown.
        if (waktuPengajuanSebelumnya > waktuCooldown) {
          return res
            .status(422)
            .json({ msg: "Pengajuan ditolak karena masih dalam cooldown" });
        }
      }
    }

    await db.execute(
      `INSERT INTO pengajuan (tanggal, nominal, deskripsi, id_kriteria, bukti, bukti_transfer, status, deskripsi_status, is_Deleted, id_users) VALUES (?, ?, ?, ?, ?,"","","",0, ? );`,
      [tanggal, nominal, deskripsi, id_kriteria, bukti, id_users]
    );
    return res
      .status(200)
      .json({ success: true, msg: "pengajuan berhasil ditambahkan" });
  } catch (error) {
    // console.log("Terjadi kesalahan:", error);
    return res.status(500).json({ msg: "terjadi kesalahan" });
  }
};

// digunakan untuk admin dalam melakukan konfirmasi pengajuan dari karyawan
export const konfirmasiPengajuan = async (req, res) => {
  const { id } = req.params;
  const { status, deskripsi_status } = req.body;

  try {
    // Periksa apakah status adalah "ditangguhkan"
    if (
      status.toLowerCase() == "ditangguhkan" ||
      status.toLowerCase() == "tolak"
    ) {
      // Jika status adalah "ditangguhkan", tidak perlu upload gambar
      await db.execute(
        `UPDATE pengajuan SET status = ?, deskripsi_status = ? WHERE id = ?;`,
        [status, deskripsi_status, id]
      );

      return res
        .status(200)
        .json({ success: true, msg: "pengajuan berhasil di konfirmasi" });
    }

    if (status.toLowerCase() === "selesai") {
      const pengajuanData = await db.query(
        `SELECT kriteria.jenis_bantuan, pengajuan.nominal, pengajuan.tanggal FROM pengajuan INNER JOIN kriteria ON kriteria.id = pengajuan.id_kriteria WHERE pengajuan.id = ? LIMIT 1;
        `,
        [id]
      );

      const keterangan = pengajuanData[0][0].jenis_bantuan;
      const nominal = pengajuanData[0][0].nominal;
      const tanggal = pengajuanData[0][0].tanggal;

      // Masukkan data ke dalam tabel keuangan
      await db.execute(
        `INSERT INTO keuangan (status, keterangan, tanggal, nominal, is_Deleted) VALUES ("pengeluaran", ?, ?, ?, 0);`,
        [keterangan, tanggal, nominal]
      );
    }

    // Lanjutkan dengan upload gambar jika status bukan "ditangguhkan"
    if (req.file === undefined) {
      return res.status(400).json({ msg: "No file uploaded" });
    }

    const { filename: bukti_transfer, size } = req.file;

    const fileSize = size;
    const imageUrl = `${process.cwd()}\\bukti_transfer\\${bukti_transfer}`;
    if (fileSize > 5000000) {
      return res.status(422).json({ msg: "Image must be smaller than 5MB" });
    }

    await db.execute(
      `UPDATE pengajuan SET bukti_transfer = ?, status = ?, deskripsi_status = ? WHERE id = ?;`,
      [bukti_transfer, status, deskripsi_status, id]
    );

    return res
      .status(200)
      .json({ success: true, msg: "pengajuan berhasil di konfirmasi" });
  } catch (error) {
    return res.status(500).json({ msg: "terjadi kesalahan", error: error });
  }
};

// digunakan untuk karyawan mengajukan ulang pengajuannya yang
export const updatePengajuan = async (req, res) => {
  const { id } = req.params;
  const { nominal, bukti, id_kriteria, deskripsi } = req.body;
  try {
    if (req.file === undefined) {
      return res.status(400).json({ msg: "No file uploaded" });
    }

    const { filename: bukti, size } = req.file;

    const fileSize = size;
    const imageUrl = `${process.cwd()}\\bukti\\${bukti}`;
    if (fileSize > 5000000) {
      return res.status(422).json({ msg: "Image must be smaller than 5MB" });
    }

    await db.execute(
      `UPDATE pengajuan SET nominal = ?, bukti = ?, id_kriteria = ?, deskripsi = ?, status = "" WHERE id = ?;`,
      [nominal, bukti, id_kriteria, deskripsi, id]
    );
    return res
      .status(200)
      .json({ success: true, msg: "pengajuan berhasil di ajukan ulang" });
  } catch (error) {
    console.log(error);

    return res.status(500).json({ msg: "terjadi kesalahan" });
  }
};

// digunakan untuk admin dalam menghapus pengajuan dengan soft delated, data tidak akan dihapus dari database
export const deletedPengajuan = async (req, res) => {
  const { id } = req.params;
  try {
    await db.execute(`UPDATE pengajuan SET is_Deleted = 1 WHERE id = ?;`, [id]);
    return res
      .status(200)
      .json({ success: true, msg: "pengajuan berhasil di hapus" });
  } catch (error) {
    return res.status(500).json({ msg: "terjadi kesalahan" });
  }
};

export const laporan = async (req, res) => {
  try {
    if (
      req.user.role == "Admin" ||
      req.user.role == "SuperAdmin" ||
      req.user.role == "Manajemen"
    ) {
      const query = await db.execute(
        `SELECT users.nama, users.no_telepon, pengajuan.id,pengajuan.tanggal, pengajuan.deskripsi, pengajuan.nominal, pengajuan.bukti, pengajuan.status, pengajuan.deskripsi_status, pengajuan.bukti_transfer,kriteria.jenis_bantuan FROM pengajuan INNER JOIN users ON users.id = pengajuan.id_users INNER JOIN kriteria ON pengajuan.id_kriteria = kriteria.id WHERE pengajuan.is_Deleted = 0;`
      );
      const laporan = query[0];
      return res.status(200).json({ success: true, data: laporan });
    }

    if (req.user.role == "Karyawan") {
      const query = await db.execute(
        `SELECT pengajuan.tanggal, pengajuan.nominal, kriteria.jenis_bantuan,pengajuan.status, pengajuan.deskripsi_status FROM pengajuan INNER JOIN users ON users.id = pengajuan.id_users INNER JOIN kriteria ON pengajuan.id_kriteria = kriteria.id WHERE pengajuan.is_Deleted = 0 AND pengajuan.status = "selesai";`
      );
      const laporan = query[0];
      return res.status(200).json({ success: true, data: laporan });
    }
  } catch (error) {
    return res.status(500).json({ msg: "terjadi kesalahan" });
  }
};
