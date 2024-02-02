import db from "../Config/Db.js";

export const getKeuangan = async (req, res) => {
  try {
    const query = await db.execute(
      `SELECT * FROM keuangan WHERE is_Deleted = 0;`
    );
    const keuangan = query[0];

    const pemasukan = await db.execute(
      `SELECT SUM(nominal) AS total_pemasukan FROM keuangan WHERE is_Deleted = 0 AND status = "pemasukan"`
    );

    const pengeluaran = await db.execute(
      `SELECT SUM(nominal) AS total_pengeluaran FROM keuangan WHERE is_Deleted = 0 AND status = "pengeluaran"`
    );

    const totalDana =
      pemasukan[0][0].total_pemasukan - pengeluaran[0][0].total_pengeluaran;

    return res
      .status(200)
      .json({ success: true, totalDana: totalDana, data: keuangan });
  } catch (error) {
    console.error("Terjadi kesalahan:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};

export const tambahKeuangan = async (req, res) => {
  const { status, keterangan, tanggal, nominal } = req.body;
  try {
    await db.execute(
      `INSERT INTO keuangan (status, keterangan, tanggal, nominal, is_Deleted) VALUES (?,?,?,?, 0);`,
      [status, keterangan, tanggal, nominal]
    );
    return res
      .status(200)
      .json({ success: true, msg: "Keuangan Berhasil ditambahkan!" });
  } catch (error) {
    console.error("Terjadi kesalahan:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};

export const updateKeuangan = async (req, res) => {
  const { id } = req.params;
  const { keterangan, nominal } = req.body;
  try {
    await db.execute(
      `UPDATE keuangan SET keterangan = ?, nominal = ? WHERE id = ?;`,
      [keterangan, nominal, id]
    );
    return res
      .status(200)
      .json({ success: true, msg: "Keuangan Berhasil di update!" });
  } catch (error) {
    console.error("Terjadi kesalahan:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};

export const deletedKeuangan = async (req, res) => {
  const { id } = req.params;
  try {
    await db.execute(`UPDATE keuangan SET is_Deleted = 1 WHERE id = ?;`, [id]);
    return res
      .status(200)
      .json({ success: true, msg: "Keuangan Berhasil di hapus!" });
  } catch (error) {
    return res.status(500).json({ msg: "Terjadi kesalahan pada server" });
  }
};
