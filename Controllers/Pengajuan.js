import db from "../Config/Db.js";

// pakai untuk admin get semua data pengajuan
export const getAllPengajuan = async (req, res) => {
  try {
    const query = await db.execute(
      `SELECT * FROM users 
      INNER JOIN pengajuan ON users.id = pengajuan.id_users 
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
      `SELECT * FROM users 
      INNER JOIN pengajuan ON users.id = pengajuan.id_users 
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
  const { id_pengajuan } = req.params;
  try {
    const query = await db.execute(
      `SELECT * FROM pengajuan where is_Deleted = 0 AND id_pengajuan = ?`,
      [id_pengajuan]
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
  const { tanggal, nominal, deskripsi, jenis_bantuan, bukti, id_users } =
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

    await db.execute(
      `INSERT INTO pengajuan (tanggal, nominal, deskripsi, jenis_bantuan, bukti, bukti_transfer, status, deskripsi_status, is_Deleted, id_users) VALUES (?, ?, ?, ?, ?,"","","",0, ? );`,
      [tanggal, nominal, deskripsi, jenis_bantuan, bukti, id_users]
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
  const { id_pengajuan } = req.params;
  const { status, deskripsi_status } = req.body;

  try {
    // Periksa apakah status adalah "ditangguhkan"
    if (status.toLowerCase() === "ditangguhkan") {
      // Jika status adalah "ditangguhkan", tidak perlu upload gambar
      await db.execute(
        `UPDATE pengajuan SET status = ?, deskripsi_status = ? WHERE id_pengajuan = ?;`,
        [status, deskripsi_status, id_pengajuan]
      );

      return res
        .status(200)
        .json({ success: true, msg: "pengajuan berhasil di konfirmasi" });
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
      `UPDATE pengajuan SET bukti_transfer = ?, status = ?, deskripsi_status = ? WHERE id_pengajuan = ?;`,
      [bukti_transfer, status, deskripsi_status, id_pengajuan]
    );

    return res
      .status(200)
      .json({ success: true, msg: "pengajuan berhasil di konfirmasi" });
  } catch (error) {
    return res.status(500).json({ msg: "terjadi kesalahan" });
  }
};

// digunakan untuk karyawan mengajukan ulang pengajuannya yang
export const updatePengajuan = async (req, res) => {
  const { id_pengajuan } = req.params;
  const { nominal, bukti, jenis_bantuan, deskripsi } = req.body;
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
      `UPDATE pengajuan SET nominal = ?, bukti = ?, jenis_bantuan = ?, deskripsi = ?, status = "" WHERE id_pengajuan = ?;`,
      [nominal, bukti, jenis_bantuan, deskripsi, id_pengajuan]
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
  const { id_pengajuan } = req.params;
  try {
    await db.execute(
      `UPDATE pengajuan SET is_Deleted = 1 WHERE id_pengajuan = ?;`,
      [id_pengajuan]
    );
    return res
      .status(200)
      .json({ success: true, msg: "pengajuan berhasil di hapus" });
  } catch (error) {
    return res.status(500).json({ msg: "terjadi kesalahan" });
  }
};
