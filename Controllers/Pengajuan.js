import db from "../Config/Db.js";

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
      `INSERT INTO pengajuan (tanggal, nominal, deskripsi, jenis_bantuan, bukti, id_users) VALUES (?, ?, ?, ?, ?, ?);`,
      [tanggal, nominal, deskripsi, jenis_bantuan, bukti, id_users]
    );
    return res
      .status(200)
      .json({ success: true, msg: "pengajuan berhasil ditambahkan" });
  } catch (error) {
    return res.status(500).json({ msg: "terjadi kesalahan" });
  }
};

export const konfirmasiPengajuan = async (req, res) => {
  const { id_pengajuan } = req.params;
  const { bukti_transfer, status, deskripsi_status } = req.body;
  try {
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
