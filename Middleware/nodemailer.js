import db from "../Config/Db.js";
import nodemailer from "nodemailer";
import { fileDir } from "../Utils/file_handler.cjs";

export const sendEmail = async (req, res) => {
  try {
    const { tanggal, deskripsi, id_kriteria, id_users } = req.body; // Ambil data dari pengajuan
    const { filename } = req.file;

    const query = await db.execute(
      `SELECT email FROM users WHERE (role = 'SuperAdmin' OR role = 'Admin') AND is_Deleted = 0 AND is_Blocked = 0;`
    );
    const maillist = query[0].map((result) => result.email);

    // Ambil data nama
    const dataUser = await db.execute(`SELECT nama FROM users WHERE id = ?`, [
      id_users,
    ]);
    const nama = dataUser[0][0].nama;

    // Ambil data bantuan
    const dataBantuan = await db.execute(
      `SELECT jenis_bantuan, nominal FROM kriteria WHERE id = ?`,
      [id_kriteria]
    );
    const jenis_bantuan = dataBantuan[0][0].jenis_bantuan;
    const nominal = dataBantuan[0][0].nominal;

    let transporter = nodemailer.createTransport({
      host: "smtp.gmail.com",
      port: 465,
      secure: true,
      auth: {
        user: "danaamal5103@gmail.com",
        pass: "xmwn ktwl lbuf psqs",
      },
    });

    let info = await transporter.sendMail({
      from: "danaamal5103@gmail.com",
      to: maillist,
      subject: "Pengajuan Dana Amala Polibatam",
      html: `
            <h1>Data pengajuan</h1>
            <p>Nama : ${nama}</p>
            <p>tanggal : ${tanggal}</p>
            <p>nominal : ${nominal}</p>
            <p>jenis bantuan : ${jenis_bantuan}</p>
            <p>deskripsi : ${deskripsi}</p>
            <img src="cid:unique@gmail.com>"/>'
            `,
      attachments: [
        {
          filename: `${filename}`,
          path: `${fileDir()}/${filename}`,
          cid: "unique@gmail.com", // Sets content ID
        },
      ],
    });

    console.log(info.messageId);
    console.log(info.accepted);
    console.log(info.rejected);
  } catch (error) {
    console.log(error);
  }
};
