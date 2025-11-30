CREATE DATABASE IF NOT EXISTS db_klinik;
USE db_klinik;

CREATE TABLE administrator (
    id_admin        INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nama_admin      VARCHAR(100) NOT NULL,
    waktu_jaga      VARCHAR(100) NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE dokter (
    id_dokter       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nama_dokter     VARCHAR(100) NOT NULL,
    tanggal_lahir   DATE NOT NULL,
    spesialis       VARCHAR(100),
    alamat_dokter   VARCHAR(255),
    no_hp           VARCHAR(20),
    waktu_kerja     VARCHAR(100) NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE pasien (
    id_pasien       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nama_pasien     VARCHAR(100) NOT NULL,
    jenis_kelamin   ENUM('L','P') NOT NULL,
    alamat_pasien   VARCHAR(255),
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE pasien_dokter (
    id              INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_dokter       INT UNSIGNED NOT NULL,
    id_pasien       INT UNSIGNED NOT NULL,
    resep           TEXT,
    waktu_periksa   TIMESTAMP,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_pasien_dokter_pasien
        FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_pasien_dokter_dokter
        FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter)
        ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE daftar (
    id_daftar       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_admin        INT UNSIGNED,
    id_pasien       INT UNSIGNED NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_daftar_pasien
        FOREIGN KEY (id_pasien) REFERENCES pasien(id_pasien)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_daftar_admin
        FOREIGN KEY (id_admin) REFERENCES administrator(id_admin)
        ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE dokter_admin (
    id_data         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_admin        INT UNSIGNED NOT NULL,
    id_dokter       INT UNSIGNED NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    CONSTRAINT fk_dokter_admin_dokter
        FOREIGN KEY (id_dokter) REFERENCES dokter(id_dokter)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_dokter_admin_admin
        FOREIGN KEY (id_admin) REFERENCES administrator(id_admin)
        ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
