-- COMMIT
START TRANSACTION;
INSERT INTO db_klinik.pasien
(nama_pasien, jenis_kelamin, alamat_pasien, created_at, updated_at)
VALUES('Riana', 'P', 'Jl. Garuda 2/14B', now(), now());
COMMIT;

-- ROLLBACK
START TRANSACTION;
UPDATE db_klinik.pasien SET nama_pasien = 'Sulistya' WHERE id_pasien = 1;
UPDATE db_klinik.pasien SET nama_pasien = 'Riani' WHERE id_pasien = 99; -- ID tidak ada → error
ROLLBACK;

-- SAVEPOINT
START TRANSACTION;
UPDATE db_klinik.pasien SET nama_pasien = 'Sulistya' WHERE id_pasien = 1;
SAVEPOINT step1;

UPDATE db_klinik.pasien SET nama_pasien = 'Riani' WHERE id_pasien = 2;
SAVEPOINT step2;

UPDATE db_klinik.pasien SET nama_pasien = 'Dana' WHERE id_pasien = 3;
-- Jika step2 dianggap salah
ROLLBACK TO step2;
COMMIT;

-- TRIGGER
-- create table log
CREATE TABLE log_pasien (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pasien INT,
    nama_pasien_lama VARCHAR(100) NOT NULL,
    nama_pasien_baru VARCHAR(100) NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- create trigger
DELIMITER $$
CREATE TRIGGER log_update_pasien
AFTER UPDATE ON pasien
FOR EACH ROW
BEGIN
    INSERT INTO log_update_pasien(id_pasien, nama_pasien_lama, nama_pasien_baru, created_at, updated_at)
    VALUES (OLD.id_pasiend, OLD.nama_pasien, NEW.nama_pasien, NOW(), NOW());
END $$
DELIMITER;

-- run update query for trigger add log
UPDATE pasien SET nama_pasien = 'Sulistya Ramadhan' WHERE id_pasien = 1;
