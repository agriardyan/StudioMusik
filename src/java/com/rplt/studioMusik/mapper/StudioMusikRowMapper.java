/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplt.studioMusik.mapper;

import com.rplt.studioMusik.extractor.StudioMusikExtractor;
import com.rplt.studioMusik.model.StudioMusik;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author root
 */
public class StudioMusikRowMapper implements RowMapper<StudioMusik> {

    @Override
    public StudioMusik mapRow(ResultSet rs, int i) throws SQLException {
        StudioMusikExtractor studioMusikExtractor = new StudioMusikExtractor();
        return studioMusikExtractor.extractData(rs);
    }
    
}
