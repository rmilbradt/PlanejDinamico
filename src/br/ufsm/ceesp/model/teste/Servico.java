package br.ufsm.ceesp.model.teste;

import br.ufsm.ceesp.model.Localizacao;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by politecnico on 02/03/2016.
 */
@Entity
@Table(name = "SERVICO")
public class Servico {

    private Long id;
    private Date dataRealizacao;
    private Date dataPrazo;
    private Localizacao localizacao;
    private Integer tempoExecucao;
    private String descricaoServico;
    private String grupo;
    private String regulada;
    private Long numOS;
    private String tipoOS;


    @Id
    @GeneratedValue
    @Column(name = "ID")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name="TIPO_OS")
    public String getTipoOS() {
        return tipoOS;
    }

    public void setTipoOS(String tipoOS) {
        this.tipoOS = tipoOS;
    }

    @Column(name="DATA_REALIZACAO")
    public Date getDataRealizacao() {
        return dataRealizacao;
    }

    public void setDataRealizacao(Date dataRealizacao) {
        this.dataRealizacao = dataRealizacao;
    }

    @Embedded
    public Localizacao getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(Localizacao localizacao) {
        this.localizacao = localizacao;
    }

    @Column(name="TEMPO_EXECUCAO")
    public Integer getTempoExecucao() {
        return tempoExecucao;
    }

    public void setTempoExecucao(Integer tempoExecucao) {
        this.tempoExecucao = tempoExecucao;
    }

    @Column(name="DESCRICAO_SERVICO")
    public String getDescricaoServico() {
        return descricaoServico;
    }

    public void setDescricaoServico(String descricaoServico) {
        this.descricaoServico = descricaoServico;
    }

    @Column(name="DATA_PRAZO")
    public Date getDataPrazo() {
        return dataPrazo;
    }

    public void setDataPrazo(Date dataPrazo) {
        this.dataPrazo = dataPrazo;
    }

    @Column(name="GRUPO")
    public String getGrupo() {
        return grupo;
    }

    public void setGrupo(String grupo) {
        this.grupo = grupo;
    }

    @Column(name="REGULADA")
    public String getRegulada() {
        return regulada;
    }

    public void setRegulada(String regulada) {
        this.regulada = regulada;
    }

    @Column(name="NUM_OS")
    public Long getNumOS() {
        return numOS;
    }

    public void setNumOS(Long numOS) {
        this.numOS = numOS;
    }
}
