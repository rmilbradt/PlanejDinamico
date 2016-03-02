package br.ufsm.ceesp.model;

import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 * Created by politecnico on 02/03/2016.
 */
@Embeddable
public class Localizacao {

    private Double latitude;
    private Double longitude;

    @Column(name = "LATITUDE")
    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    @Column(name = "LONGITUDE")
    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }
}
