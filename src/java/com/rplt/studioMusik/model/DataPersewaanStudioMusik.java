/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rplt.studioMusik.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author root
 */
public class DataPersewaanStudioMusik {

    private String mKodeSewa;
    private String mKodeStudio;
    private String mNamaPenyewa;
    private String mNomorTeleponPenyewa;
    private String mTanggalSewa;
    private String mJamSewa;
    private int mDurasi;
    private int mBiayaPelunasan;
    private STATUS_PELUNASAN mStatusPelunasan;

    public enum STATUS_PELUNASAN {

        UANG_MUKA, LUNAS;
    }

    public DataPersewaanStudioMusik() {
    }

    public String getmKodeSewa() {
        return mKodeSewa;
    }

    public void setmKodeSewa(String mKodeSewa) {
        this.mKodeSewa = mKodeSewa;
    }

    public String getmKodeStudio() {
        return mKodeStudio;
    }

    public void setmKodeStudio(String mKodeStudio) {
        this.mKodeStudio = mKodeStudio;
    }

    public String getmNamaPenyewa() {
        return mNamaPenyewa;
    }

    public void setmNamaPenyewa(String mNamaPenyewa) {
        this.mNamaPenyewa = mNamaPenyewa;
    }

    public String getmNomorTeleponPenyewa() {
        return mNomorTeleponPenyewa;
    }

    public void setmNomorTeleponPenyewa(String mNomorTeleponPenyewa) {
        this.mNomorTeleponPenyewa = mNomorTeleponPenyewa;
    }

    public String getmTanggalSewa() {
        return mTanggalSewa;
    }

    public void setmTanggalSewa(String mTanggalSewa) {
        this.mTanggalSewa = mTanggalSewa;
    }

    public String getmJamSewa() {
        return mJamSewa;
    }

    public void setmJamSewa(String mJamSewa) {
        this.mJamSewa = mJamSewa;
    }

    public int getmDurasi() {
        return mDurasi;
    }

    public void setmDurasi(int mDurasi) {
        this.mDurasi = mDurasi;
    }

    public int getmBiayaPelunasan() {
        return mBiayaPelunasan;
    }

    public void setmBiayaPelunasan(int mBiayaPelunasan) {
        this.mBiayaPelunasan = mBiayaPelunasan;
    }

    public STATUS_PELUNASAN getmStatusPelunasan() {
        return mStatusPelunasan;
    }

    public void setmStatusPelunasan(STATUS_PELUNASAN mStatusPelunasan) {
        this.mStatusPelunasan = mStatusPelunasan;
    }

    public static void simpanData(DataPersewaanStudioMusik pDataPersewaanStudioMusik) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        String sql = "INSERT INTO data_persewaan_studio_musik VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql,
                new Object[]{
                    pDataPersewaanStudioMusik.getmKodeSewa(),
                    pDataPersewaanStudioMusik.getmKodeStudio(),
                    pDataPersewaanStudioMusik.getmNamaPenyewa(),
                    pDataPersewaanStudioMusik.getmNomorTeleponPenyewa(),
                    pDataPersewaanStudioMusik.getmTanggalSewa(),
                    pDataPersewaanStudioMusik.getmJamSewa(),
                    pDataPersewaanStudioMusik.getmDurasi(),
                    pDataPersewaanStudioMusik.getmBiayaPelunasan(),
                    pDataPersewaanStudioMusik.getmStatusPelunasan()
                });
    }

    public static List<StudioMusik> getDataList() {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List pegawaiList = new ArrayList();

        String sql = "SELECT * FROM data_persewaan_studio_musik";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        pegawaiList = jdbcTemplate.query(sql, new DataPersewaanStudioMusikRowMapper());
        return pegawaiList;
    }

    public static void updateData(DataPersewaanStudioMusik pDataPersewaanStudioMusik) {
        DataSource dataSource = DatabaseConnection.getmDataSource();

        String sql = "UPDATE data_persewaan_studio_musik SET "
                + "kode_studio = ?, "
                + "nama_penyewa = ?, "
                + "nomor_telepon = ?, "
                + "tanggal_sewa = ?, "
                + "jam_sewa = ?, "
                + "durasi = ?, "
                + "biaya_pelunasan = ?, "
                + "status_pelunasan = ? "
                + "WHERE kode_sewa = ?";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        jdbcTemplate.update(sql,
                new Object[]{
                    pDataPersewaanStudioMusik.getmKodeStudio(),
                    pDataPersewaanStudioMusik.getmNamaPenyewa(),
                    pDataPersewaanStudioMusik.getmNomorTeleponPenyewa(),
                    pDataPersewaanStudioMusik.getmTanggalSewa(),
                    pDataPersewaanStudioMusik.getmJamSewa(),
                    pDataPersewaanStudioMusik.getmDurasi(),
                    pDataPersewaanStudioMusik.getmBiayaPelunasan(),
                    pDataPersewaanStudioMusik.getmStatusPelunasan(),
                    pDataPersewaanStudioMusik.getmKodeSewa()
                });
    }

    public static void deleteData(String pKodeSewa) {
        DataSource dataSource = DatabaseConnection.getmDataSource();

        String sql = "DELETE FROM data_persewaan_studio_musik WHERE kode_sewa = " + pKodeSewa;
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.update(sql);
    }

    public static class DataPersewaanStudioMusikRowMapper implements RowMapper<DataPersewaanStudioMusik> {

        @Override
        public DataPersewaanStudioMusik mapRow(ResultSet rs, int i) throws SQLException {
            DataPersewaanStudioMusikExtractor dataPersewaanStudioMusikExtractor = new DataPersewaanStudioMusikExtractor();
            return dataPersewaanStudioMusikExtractor.extractData(rs);
        }

        public static class DataPersewaanStudioMusikExtractor implements ResultSetExtractor<DataPersewaanStudioMusik> {

            @Override
            public DataPersewaanStudioMusik extractData(ResultSet rs) throws SQLException, DataAccessException {
                DataPersewaanStudioMusik dataPersewaanStudioMusik = new DataPersewaanStudioMusik();

                dataPersewaanStudioMusik.setmKodeSewa(rs.getString(1));
                dataPersewaanStudioMusik.setmKodeStudio(rs.getString(2));
                dataPersewaanStudioMusik.setmNamaPenyewa(rs.getString(3));
                dataPersewaanStudioMusik.setmNomorTeleponPenyewa(rs.getString(4));
                dataPersewaanStudioMusik.setmTanggalSewa(rs.getString(5));
                dataPersewaanStudioMusik.setmJamSewa(rs.getString(6));
                dataPersewaanStudioMusik.setmDurasi(rs.getInt(7));
                dataPersewaanStudioMusik.setmBiayaPelunasan(rs.getInt(8));
                dataPersewaanStudioMusik.setmStatusPelunasan(DataPersewaanStudioMusik.STATUS_PELUNASAN.UANG_MUKA);

                return dataPersewaanStudioMusik;
            }

        }

    }

}
