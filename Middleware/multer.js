import multer from "multer";

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "D:/Project/dap_be/public/bukti/");
  },
  filename: function (req, file, cb) {
    // validatin mime type in here
    const uniqueSuffix = Date.now().toString();
    cb(null, `${uniqueSuffix}${file.originalname}`);

    //   false
  },
});

export default multer({ storage: storage }).single("bukti");
