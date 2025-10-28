-- DMDBI.VW_RESUMEN_ORDENES source
--Ordenes BBEE APERTURADA

WITH RESUMEN_ORDENES_DYNY AS (
select prcn_ano,
	   prcn_mes,
	   adhr_numero, 
	   nvl( scrs_cod_div_cartera, a.scrs_codigo ) scrs_codigo,
	   CDRS_CDG,
	   tipo_orden,
	   cnct_cuenta
       --, sum(  decode( desc_cuenta, 'GASTOS_MARKETING', rsor_monto, 0 ) ) gastos_mkt
       --, sum( decode( desc_cuenta, 'GASTOS_MEDICOS', rsor_monto, 0 ) ) gastos_medicos
       , sum(  decode( desc_cuenta, 'GASTOS_PPEE', rsor_monto, 0 ) ) gastos_ppee
       --, sum(  decode( desc_cuenta, 'GASTOS_PRP', rsor_monto, 0 ) ) gastos_prp
       --, sum(  decode( desc_cuenta, 'OTROS_GASTOS', rsor_monto, 0 ) ) otros_gastos
       --, sum(  decode( desc_cuenta, 'OTROS_INGRESOS', rsor_monto, 0 ) ) otros_ing
       --, sum(  decode( desc_cuenta, 'INGRESOS_POLI', rsor_monto, 0 ) ) ingresos_poli
       --, sum(  decode( desc_cuenta, 'GASTOS_POLI', rsor_monto, 0 ) ) gastos_poli
        from (  select o.prcn_ano
                     , lpad( o.prcn_mes, 2, '0' ) prcn_mes
                     , s.adhr_numero
                     , o.atdn_scrs_codigo scrs_codigo
                     , o.CDRS_CDG
                     , cnct_cuenta
                     , case
                           when cnct_cuenta between 410000 and 410299 then 'INGRESOS_COTIZ'
        --                 when cnct_cuenta = 410400 then 'INGRESOS_COTIZ'
        --                 when cnct_cuenta = 420141 then 'INGRESOS_COTIZ'
                           when cnct_cuenta between 410300 and 499999 then 'OTROS_INGRESOS'
                           when cnct_cuenta = 510805 then 'OTROS_GASTOS'
        --                 when cnct_cuenta in (511301, 511303, 511310, 511302, 511304, 511305, 511321) then 'GASTOS_MARKETING'
                           when cnct_cuenta in (512416, 520600) then 'GASTOS_MEDICOS'
        --                 when cnct_cuenta between 511311 and 511313 then 'GASTOS_MARKETING'
                           when cnct_cuenta between 510600 and 510799 then 'GASTOS_MEDICOS'
                           when cnct_cuenta between 520601 and 520602 then 'GASTOS_PPEE'
                           when cnct_cuenta between 510000 and 510299 then 'GASTOS_PPEE'
                           when cnct_cuenta between 512400 and 512499 then 'GASTOS_PPEE'
                           when cnct_cuenta between 510800 and 510899 then 'GASTOS_PRP'
                           when cnct_cuenta between 510000 and 599999 then 'OTROS_GASTOS'
                           when cnct_cuenta between 410000 and 499999 then 'OTROS_INGRESOS'
                       end
                           desc_cuenta
                     , 'LEY' tipo_orden
                     , sum( o.orsn_monto ) rsor_monto
                  from siniestros.ordenes_siniestro o, siniestros.siniestros s, siniestros.atenciones_denuncia a
                 where o.atdn_id_unico = a.atdn_numero_sap
                   and a.snst_id_unico = s.snst_id_unico
              group by s.adhr_numero
                     , o.prcn_ano
                     , lpad( o.prcn_mes, 2, '0' )
                     , case
                           when cnct_cuenta between 410000 and 410299 then 'INGRESOS_COTIZ'
        --                 when cnct_cuenta = 410400 then 'INGRESOS_COTIZ'
        --                 when cnct_cuenta = 420141 then 'INGRESOS_COTIZ'
                           when cnct_cuenta between 410300 and 499999 then 'OTROS_INGRESOS'
                           when cnct_cuenta = 510805 then 'OTROS_GASTOS'
        --                 when cnct_cuenta in (511301, 511303, 511310, 511302, 511304, 511305, 511321) then 'GASTOS_MARKETING'
                           when cnct_cuenta in (512416, 520600) then 'GASTOS_MEDICOS'
        --                 when cnct_cuenta between 511311 and 511313 then 'GASTOS_MARKETING'
                           when cnct_cuenta between 510600 and 510799 then 'GASTOS_MEDICOS'
                           when cnct_cuenta between 520601 and 520602 then 'GASTOS_PPEE'
                           when cnct_cuenta between 510000 and 510299 then 'GASTOS_PPEE'
                           when cnct_cuenta between 512400 and 512499 then 'GASTOS_PPEE'
                           when cnct_cuenta between 510800 and 510899 then 'GASTOS_PRP'
                           when cnct_cuenta between 510000 and 599999 then 'OTROS_GASTOS'
                           when cnct_cuenta between 410000 and 499999 then 'OTROS_INGRESOS'
                       end
                     , o.atdn_scrs_codigo
                     , o.CDRS_CDG
                     ,cnct_cuenta
              union all
                select o.prcn_ano
                     , lpad( o.prcn_mes, 2, '0' )
                     , o.adhr_numero
                     , scrs_codigo
                     , o.CDRS_CDG
                     , cnct_cuenta
                     , case
                           when cnct_cuenta between 410000 and 410299 then 'INGRESOS_COTIZ'
        --                 when cnct_cuenta = 410400 then 'INGRESOS_COTIZ'
        --                 when cnct_cuenta = 420141 then 'INGRESOS_COTIZ'
                           when cnct_cuenta between 410300 and 499999 then 'OTROS_INGRESOS'
                           when cnct_cuenta = 510805 then 'OTROS_GASTOS'
        --                 when cnct_cuenta in (511301, 511303, 511310, 511302, 511304, 511305, 511321) then 'GASTOS_MARKETING'
                           when cnct_cuenta in (512416, 520600) then 'GASTOS_MEDICOS'
        --                 when cnct_cuenta between 511311 and 511313 then 'GASTOS_MARKETING'
                           when cnct_cuenta between 510600 and 510799 then 'GASTOS_MEDICOS'
                           when cnct_cuenta between 520601 and 520602 then 'GASTOS_PPEE'
                           when cnct_cuenta between 510000 and 510299 then 'GASTOS_PPEE'
                           when cnct_cuenta between 512400 and 512499 then 'GASTOS_PPEE'
                           when cnct_cuenta between 510800 and 510899 then 'GASTOS_PRP'
                           when cnct_cuenta between 510000 and 599999 then 'OTROS_GASTOS'
                           when cnct_cuenta between 410000 and 499999 then 'OTROS_INGRESOS'
                       end  desc_cuenta
                     , 'LEY' tipo_orden
                     , sum( o.orem_monto ) rsor_monto
                  from siniestros.ordenes_empresa o
              group by o.adhr_numero
                     , o.prcn_ano
                     , lpad( o.prcn_mes, 2, '0' )
                     , case
                           when cnct_cuenta between 410000 and 410299 then 'INGRESOS_COTIZ'
        --                 when cnct_cuenta = 410400 then 'INGRESOS_COTIZ'
        --                 when cnct_cuenta = 420141 then 'INGRESOS_COTIZ'
                           when cnct_cuenta between 410300 and 499999 then 'OTROS_INGRESOS'
                           when cnct_cuenta = 510805 then 'OTROS_GASTOS'
        --                 when cnct_cuenta in (511301, 511303, 511310, 511302, 511304, 511305, 511321) then 'GASTOS_MARKETING'
                           when cnct_cuenta in (512416, 520600) then 'GASTOS_MEDICOS'
        --                 when cnct_cuenta between 511311 and 511313 then 'GASTOS_MARKETING'
                           when cnct_cuenta between 510600 and 510799 then 'GASTOS_MEDICOS'
                           when cnct_cuenta between 520601 and 520602 then 'GASTOS_PPEE'
                           when cnct_cuenta between 510000 and 510299 then 'GASTOS_PPEE'
                           when cnct_cuenta between 512400 and 512499 then 'GASTOS_PPEE'
                           when cnct_cuenta between 510800 and 510899 then 'GASTOS_PRP'
                           when cnct_cuenta between 510000 and 599999 then 'OTROS_GASTOS'
                           when cnct_cuenta between 410000 and 499999 then 'OTROS_INGRESOS'
                       end
                     , o.scrs_codigo 
                     , o.CDRS_CDG
                     , cnct_cuenta
              union all
                  select prcn_ano
                       , prcn_mes
                       , rtps_adhr_numero
                       , dlgc_cdg
                       , CDRS_CDG
                       , a.CNCT_CTA AS cnct_cuenta
                       , case when cnct_nivel1 = 'INGRESOS' then 'INGRESOS_POLI'
                              when cnct_nivel1 = 'GASTOS' then 'GASTOS_POLI' end desc_cuenta
                       , case when rtps_tipo_poli = 'PRIVADO' then 'POLI PRIV' else rtps_tipo_poli end rtps_tipo_poli
                       , sum( -rcdr_mes_actual ) rsor_monto
                    from genesis.resumen_cdr a join dmdbi.rentabilidad_poli_suc b on a.dlgc_cdg = b.rtps_cod_suc
                                      join genesis.cuentas_contables c on a.cnct_cta = c.cnct_cta
                   where dlgc_cdg between '500' and '800'
                     and rcdr_mes_actual is not null
                     and c.cnct_nivel2 in ('INGRESOS OPERACIONALES', 'GASTOS OPERACIONALES' )
                group by prcn_ano
                       , prcn_mes
                       , rtps_adhr_numero
                       , dlgc_cdg
                       , CDRS_CDG
                       , a.CNCT_CTA
                       , case when cnct_nivel1 = 'INGRESOS' then 'INGRESOS_POLI'
                              when cnct_nivel1 = 'GASTOS' then 'GASTOS_POLI' end 
                       , case when rtps_tipo_poli = 'PRIVADO' then 'POLI PRIV' else rtps_tipo_poli end
                         ) a left join siniestros.sucursales b on a.scrs_codigo = b.scrs_codigo
    group by prcn_ano, prcn_mes, adhr_numero
           , nvl( scrs_cod_div_cartera, a.scrs_codigo ),CDRS_CDG, tipo_orden,cnct_cuenta
           
           )
           
--,TABLA_PRUEBA_DYNY AS (
SELECT ROD.prcn_ano,
	   ROD.prcn_mes,
	   ROD.adhr_numero
	   ,CON.ADHR_RAZON_SOCIAL  AS "ADHR_RAZON_SOCIAL"
	   ,CON.HLDG_ID            AS "HLDG_ID"
	   ,CON.HLDG_HOLDING       AS "HLDG_HOLDING"
	   ,ROD.scrs_codigo
	   ,CDRS_CDG
	   ,tipo_orden
	   ,cnct_cuenta
	   ,l."Nivel 1"                           AS "Nivel 1"
       ,l."Nivel 2"                           AS "Nivel 2"
       ,l."Nivel 3"                           AS "Nivel 3"
       ,c.CNCT_DSC                            AS "Nombre Cuenta"
	   ,SUM(gastos_ppee) AS GASTOS_BBEE
FROM RESUMEN_ORDENES_DYNY ROD
LEFT JOIN siniestros.CONTRATOS CON ON ROD.adhr_numero = CON.ADHR_NUMERO
LEFT JOIN genesis.cuentas_contables c ON ROD.cnct_cuenta = c.cnct_cta
LEFT JOIN SG_PCG."Destino_Cuenta_LCE" l
           ON ROD.cnct_cuenta = l."Cuenta Revisa"
WHERE ROD.prcn_ano = 2025
AND ROD.prcn_mes <=9
-- AND HLDG_ID  IN ('H00006','H00154','H00115','H01021','H00931','H01518','H00260','H00234','H00374','H00668','H00077')
GROUP BY 
	   ROD.prcn_ano,
	   ROD.prcn_mes,
	   ROD.adhr_numero
	   ,CON.ADHR_RAZON_SOCIAL
	   ,CON.HLDG_ID
	   ,CON.HLDG_HOLDING
	   ,ROD.scrs_codigo
	   ,CDRS_CDG
	   ,tipo_orden
	   ,cnct_cuenta
	   ,l."Nivel 1"
       ,l."Nivel 2"
       ,l."Nivel 3"
       ,c.CNCT_DSC   
/*)


SELECT SUM (GASTOS_BBEE)
FROM TABLA_PRUEBA_DYNY 

	   