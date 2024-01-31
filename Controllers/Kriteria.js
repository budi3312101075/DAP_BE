import db from "../Config/Db.js";

export const getKriteria = async (req, res) => {
  try {
    const query = await db.execute(
      `SELECT * FROM kriteria WHERE is_Deleted = 0;`
    );
    const kriteria = query[0];
    return res.status(200).json({ success: true, data: kriteria });
  } catch (error) {
    console.error("Terjadi kesalahan:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};

// Contoh controller untuk menambahkan data ke database
export const tambahKriteria = async (req, res) => {
  const { jenis_bantuan, nominal, keterangan, dokumen, batas_waktu } = req.body;

  try {
    await db.execute(
      `INSERT INTO kriteria (jenis_bantuan, nominal, keterangan, dokumen, batas_waktu, is_Deleted) VALUES (?, ?, ?, ?, ?, 0);`,
      [jenis_bantuan, nominal, keterangan, dokumen, batas_waktu]
    );

    return res
      .status(200)
      .json({ success: true, msg: "pengajuan berhasil ditambahkan" });
  } catch (error) {
    console.log("Terjadi kesalahan:", error);
    // return res.status(500).json({ msg: "terjadi kesalahan" });
  }
};

export const updateKriteria = async (req, res) => {
  const { id } = req.params;
  const { jenis_bantuan, nominal, keterangan, dokumen, batas_waktu } = req.body;

  try {
    await db.execute(
      `UPDATE kriteria SET jenis_bantuan = ?, nominal = ?, keterangan = ?, dokumen = ?, batas_waktu = ? WHERE id = ?;`,
      [jenis_bantuan, nominal, keterangan, dokumen, batas_waktu, id]
    );
    return res
      .status(200)
      .json({ success: true, msg: "pengajuan berhasil di update" });
  } catch (error) {
    console.log("Terjadi kesalahan:", error);
    // return res.status(500).json({ msg: "terjadi kesalahan" });
  }
};

export const deletedKriteria = async (req, res) => {
  const { id } = req.params;

  try {
    await db.execute(`UPDATE kriteria SET is_Deleted = 1 WHERE id = ?;`, [id]);
    return res
      .status(200)
      .json({ success: true, msg: "pengajuan berhasil di hapus" });
  } catch (error) {
    return res.status(500).json({ msg: "terjadi kesalahan" });
  }
};
