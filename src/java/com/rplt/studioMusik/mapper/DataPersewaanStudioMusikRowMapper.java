/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.rplt.studioMusik.mapper;

import com.rplt.studioMusik.extractor.DataPersewaanStudioMusikExtractor;
import com.rplt.studioMusik.model.DataPersewaanStudioMusik;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

/**
 *
 * @author root
 */
public class DataPersewaanStudioMusikRowMapper implements RowMapper<DataPersewaanStudioMusik> {

    @Override
    public DataPersewaanStudioMusik mapRow(ResultSet rs, int i) throws SQLException {
        DataPersewaanStudioMusikExtractor dataPersewaanStudioMusikExtractor = new DataPersewaanStudioMusikExtractor();
        return dataPersewaanStudioMusikExtractor.extractData(rs);  
    }
    
}
