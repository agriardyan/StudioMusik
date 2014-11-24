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
import org.springframework.jdbc.support.rowset.ResultSetWrappingSqlRowSet;
import org.springframework.jdbc.support.rowset.SqlRowSet;

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
    private String mJamSelesai;
    private int mDurasi;
    private int mBiayaPelunasan;
    private String mStatusPelunasan;

    public static class STATUS_PELUNASAN {

        public static final String UANG_MUKA = "UANG MUKA";
        public static final String LUNAS = "LUNAS";
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

    public String getmStatusPelunasan() {
        return mStatusPelunasan;
    }

    public void setmStatusPelunasan(String mStatusPelunasan) {
        this.mStatusPelunasan = mStatusPelunasan;
    }

    public String getGeneratedKodeSewa() {

        DataSource dataSource = DatabaseConnection.getmDataSource();

        String sql = "SELECT to_char(max(kode_sewa) + 1, '099999') FROM data_persewaan_studio_musik";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        return jdbcTemplate.queryForObject(sql, String.class, (Object[]) null).trim();
    }

    private static void hitungJamSelesai(DataPersewaanStudioMusik pDataPersewaanStudioMusik) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List<DataPersewaanStudioMusik> pegawaiList = new ArrayList<DataPersewaanStudioMusik>();

        String sql = "UPDATE data_persewaan_studio_musik SET "
                + " jam_selesai = "
                + "to_date((SELECT to_char((JAM_SEWA + " + pDataPersewaanStudioMusik.getmDurasi() + " / 1440), 'HH24:MI') FROM data_persewaan_studio_musik WHERE kode_sewa = ?), 'HH24:MI') "
                + "WHERE kode_sewa = ?";

        System.out.println(sql);

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        jdbcTemplate.update(sql, new Object[]{
            pDataPersewaanStudioMusik.getmKodeSewa(),
            pDataPersewaanStudioMusik.getmKodeSewa()
        });
    }

    public void setmJamSelesai(String mJamSelesai) {
        this.mJamSelesai = mJamSelesai;
    }

    public String getmJamSelesai() {
        return mJamSelesai;
    }

    public static void simpanData(DataPersewaanStudioMusik pDataPersewaanStudioMusik) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

        String sql = "INSERT INTO data_persewaan_studio_musik (KODE_SEWA, KODE_STUDIO, NAMA_PENYEWA, NOMOR_TELEPON, TANGGAL_SEWA, JAM_SEWA, JAM_SELESAI, BIAYA_PELUNASAN, STATUS_PELUNASAN) "
                + "VALUES ("
                + "(SELECT to_char((max(kode_sewa)) + 1, 'FM099999') FROM data_persewaan_studio_musik), "
                + "?, ?, ?, ?, TO_DATE(?, 'HH24:MI'), TO_DATE(?, 'HH24:MI'), ?, ?)";
        
        System.out.println(sql);

        jdbcTemplate.update(sql,
                new Object[]{
                    pDataPersewaanStudioMusik.getmKodeStudio(),
                    pDataPersewaanStudioMusik.getmNamaPenyewa(),
                    pDataPersewaanStudioMusik.getmNomorTeleponPenyewa(),
                    pDataPersewaanStudioMusik.getmTanggalSewa(),
                    pDataPersewaanStudioMusik.getmJamSewa(),
                    pDataPersewaanStudioMusik.getmJamSewa(),
                    pDataPersewaanStudioMusik.getmBiayaPelunasan(),
                    pDataPersewaanStudioMusik.getmStatusPelunasan()
                });
        
        pDataPersewaanStudioMusik.setmKodeSewa(jdbcTemplate.queryForObject("SELECT to_char(max(kode_sewa), 'FM099999') FROM data_persewaan_studio_musik", String.class));
        
        hitungJamSelesai(pDataPersewaanStudioMusik);
    }

    public static List<DataPersewaanStudioMusik> getDataList() {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List<DataPersewaanStudioMusik> pegawaiList = new ArrayList<DataPersewaanStudioMusik>();

        String sql = "SELECT * FROM data_persewaan_studio_musik";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        pegawaiList = jdbcTemplate.query(sql, new DataPersewaanStudioMusikRowMapper());
        return pegawaiList;
    }
    
    public static List<DataPersewaanStudioMusik> getDataListByMonth(String pBulan, String pTahun) {
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List<DataPersewaanStudioMusik> pegawaiList = new ArrayList<DataPersewaanStudioMusik>();

        String sql = "SELECT * FROM data_persewaan_studio_musik WHERE to_char(tanggal_sewa, 'mm-yyyy') = '"+pBulan+"-"+pTahun+"'";

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        pegawaiList = jdbcTemplate.query(sql, new DataPersewaanStudioMusikRowMapper());
        return pegawaiList;
    }

    public static boolean cekKetersediaanJadwal(DataPersewaanStudioMusik pDataPersewaanStudioMusik) {
        
        DataSource dataSource = DatabaseConnection.getmDataSource();
        List<DataPersewaanStudioMusik> pegawaiList = new ArrayList<DataPersewaanStudioMusik>();

        String kodeStudio = pDataPersewaanStudioMusik.getmKodeStudio();
        String tanggalSewa = pDataPersewaanStudioMusik.getmTanggalSewa();
        String jamSewa = pDataPersewaanStudioMusik.getmJamSewa();
        String jamSelesai = pDataPersewaanStudioMusik.getmJamSelesai();

        String sql = "SELECT * FROM DATA_PERSEWAAN_STUDIO_MUSIK WHERE "
                + "kode_studio = '" + kodeStudio + "' "
                + "AND tanggal_sewa = '" + tanggalSewa + "' "
                + "AND ("
                + "to_char(jam_sewa,'HH24:MI') "
                + "BETWEEN '" + jamSewa + "' AND '" + jamSelesai + "' "
                + "AND "
                + "(to_char(jam_selesai,'HH24:MI') > '" + jamSewa + "' AND "
                + "to_char(jam_sewa,'HH24:MI') < '" + jamSelesai + "')"
                + ")";

        System.out.println(sql);

        JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
        pegawaiList = jdbcTemplate.query(sql, new DataPersewaanStudioMusikRowMapper());

        if (pegawaiList.size() <= 0) {
            return true;
        } else {
            return false;
        }
    }

//    SELECT * FROM cobacoba WHERE
//to_char(jam_mulai,'hh24:mi:ss.FF3')
//BETWEEN '10:00:00' AND '11:00:00' 
//OR 
//(to_char(jam_selesai,'hh24:mi:ss.FF3') > '10:00:00' AND 
//to_char(jam_mulai,'hh24:mi:ss.FF3') < '11:00:00');
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
                dataPersewaanStudioMusik.setmJamSelesai(rs.getString(7));
                dataPersewaanStudioMusik.setmBiayaPelunasan(Integer.parseInt(rs.getString(8)));
                dataPersewaanStudioMusik.setmStatusPelunasan(rs.getString(9));

                return dataPersewaanStudioMusik;
            }

        }

    }

}
