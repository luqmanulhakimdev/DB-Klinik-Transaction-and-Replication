INSERT INTO db_klinik.administrator
(id_admin, nama_admin, waktu_jaga, created_at, updated_at)
VALUES(1, 'administrator', '07:00 - 16:00', '2025-11-28 19:04:02', '2025-11-28 19:04:02');

INSERT INTO db_klinik.dokter
(id_dokter, nama_dokter, tanggal_lahir, spesialis, alamat_dokter, no_hp, waktu_kerja, created_at, updated_at)
VALUES(1, 'Dr Donny Firdaus', '1997-07-23', 'Dokter Umum', 'Jl. Kencana 2B/13', '+62811737410', '07:00 - 16:00', '2025-11-28 19:05:47', '2025-11-28 19:05:47');

INSERT INTO db_klinik.dokter_admin
(id_data, id_admin, id_dokter, created_at, updated_at)
VALUES(1, 1, 1, '2025-11-28 19:06:19', '2025-11-28 19:06:19');

INSERT INTO db_klinik.pasien
(id_pasien, nama_pasien, jenis_kelamin, alamat_pasien, created_at, updated_at)
VALUES(1, 'Sulistyo', 'L', 'Jl. Kemayoran Lama 17C', '2025-11-28 19:07:39', '2025-11-28 19:07:39');

INSERT INTO db_klinik.daftar
(id_daftar, id_admin, id_pasien, created_at, updated_at)
VALUES(1, 1, 1, '2025-11-28 19:07:46', '2025-11-28 19:07:46');

INSERT INTO db_klinik.pasien_dokter
(id, id_dokter, id_pasien, resep, waktu_periksa, created_at, updated_at)
VALUES(1, 1, 1, '- Paracetamol: 3x sehari sesudah makan
- Ibuprofen: 2x sehari sesudah makan

Catatan:
- Perbanyak minum air untuk mencegah dehidrasi
- Istirahat cukup dan hindari aktivitas berat
- Kompres hangat di dahi, leher, ketiak
- Konsumsi makanan bergizi ringan dan mudah dicerna
- Gunakan pakaian yang tidak terlalu tebal agar panas mudah keluar', '2025-11-28 10:45:00', '2025-11-28 19:08:43', '2025-11-28 19:10:37');

