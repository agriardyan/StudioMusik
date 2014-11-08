/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplt.studioMusik.model;

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
    
    
    
}
