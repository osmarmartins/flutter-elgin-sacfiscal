import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/venda_entity.dart';
import 'package:pdvandroid_flutter/infrastructure/services/sqlite/entity/venda_item_entity.dart';

String nfceGerarXML(
  VendaEntity venda,
  List<VendaItemEntity> itens,
) {
  String itensVenda = '';

  for (var item in itens) {
    itensVenda += '''
<det nItem="${item.id}">
    <prod>
        <cProd>${item.cprod}</cProd>
        <cEAN>${item.cean}</cEAN>
        <xProd>${item.xprod}</xProd>
        <NCM>${item.ncm}</NCM>
        <CEST>${item.cest}</CEST>
        <CFOP>${item.cfop}</CFOP>
        <uCom>${item.ucom}</uCom>
        <qCom>${item.qcom}</qCom>
        <vUnCom>${item.vuncom}</vUnCom>
        <vProd>${item.vprod}</vProd>
        <cEANTrib>${item.ceantrib}</cEANTrib>
        <uTrib>${item.utrib}</uTrib>
        <qTrib>${item.qcom}</qTrib>
        <vUnTrib>${item.vuntrib}</vUnTrib>
        <indTot>1</indTot>
    </prod>
    <imposto>
        <vTotTrib>0.34</vTotTrib>
        <ICMS>
            <ICMSSN500>
                <orig>0</orig>
                <CSOSN>500</CSOSN>
            </ICMSSN500>
        </ICMS>
        <PIS>
            <PISNT>
                <CST>07</CST>
            </PISNT>
        </PIS>
        <COFINS>
            <COFINSNT>
                <CST>07</CST>
            </COFINSNT>
        </COFINS>
    </imposto>
</det>
    ''';
  }

  String arquivoXml = '''
<?xml version="1.0" encoding="UTF-8"?>
<NFe xmlns="http://www.portalfiscal.inf.br/nfe">
    <infNFe versao="4.00" Id="NFe43211014063822000126650010000000021018175250">
        <ide>
            <cUF>43</cUF>
            <cNF>${venda.id}</cNF>
            <natOp>VENDA</natOp>
            <mod>65</mod>
            <serie>1</serie>
            <nNF>${venda.id}</nNF>
            <dhEmi>2021-10-13T19:22:12-03:00</dhEmi>
            <tpNF>1</tpNF>
            <idDest>1</idDest>
            <cMunFG>4304408</cMunFG>
            <tpImp>4</tpImp>
            <tpEmis>1</tpEmis>
            <cDV>0</cDV>
            <tpAmb>2</tpAmb>
            <finNFe>1</finNFe>
            <indFinal>1</indFinal>
            <indPres>1</indPres>
            <procEmi>0</procEmi>
            <verProc>ACBrNFe</verProc>
        </ide>
        <emit>
            <CNPJ>14200166000166</CNPJ>
            <xNome>ELGIN INDUSTRIAL DA AMAZONIA LTDA</xNome>
            <xFant>ELGIN INDUSTRIAL DA AMAZONIA LTDA</xFant>
            <enderEmit>
                <xLgr>AVENIDA ABIURANA</xLgr>
                <nro>579</nro>
                <xBairro>DIST INDUSTRIA</xBairro>
                <cMun>1302603</cMun>
                <xMun>Manus</xMun>
                <UF>AM</UF>
                <CEP>69075010</CEP>
                <cPais>1058</cPais>
                <xPais>BRASIL</xPais>
                <fone>9999999999</fone>
            </enderEmit>
            <IE>0220066671</IE>
            <CRT>1</CRT>
        </emit>
$itensVenda
        <total>
            <ICMSTot>
                <vBC>0.00</vBC>
                <vICMS>0.00</vICMS>
                <vICMSDeson>0.00</vICMSDeson>
                <vFCP>0.00</vFCP>
                <vBCST>0.00</vBCST>
                <vST>0.00</vST>
                <vFCPST>0.00</vFCPST>
                <vFCPSTRet>0.00</vFCPSTRet>
                <vProd>${venda.vprod}</vProd>
                <vFrete>0.00</vFrete>
                <vSeg>0.00</vSeg>
                <vDesc>0.00</vDesc>
                <vII>0.00</vII>
                <vIPI>0.00</vIPI>
                <vIPIDevol>0.00</vIPIDevol>
                <vPIS>0.00</vPIS>
                <vCOFINS>0.00</vCOFINS>
                <vOutro>0.00</vOutro>
                <vNF>${venda.vnf}</vNF>
                <vTotTrib>0.00</vTotTrib>
            </ICMSTot>
        </total>
        <transp>
            <modFrete>9</modFrete>
        </transp>
        <pag>
            <detPag>
                <tPag>01</tPag>
                <vPag>${venda.vnf}</vPag>
            </detPag>
            <vTroco>${(venda.vliq! - venda.vnf!).toStringAsFixed(2)}</vTroco>
        </pag>
        <infAdic>
            <infCpl>Federal R\$ 0,16 ;Estadual R\$ 0,18 ;Municipal R\$ 0,00</infCpl>
        </infAdic>
    </infNFe>
    <infNFeSupl>
        <qrCode></qrCode>
        <urlChave>www.sefaz.rs.gov.br/nfce/consulta</urlChave>
    </infNFeSupl>
    <Signature xmlns="http://www.w3.org/2000/09/xmldsig#">
        <SignedInfo>
            <CanonicalizationMethod Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
            <SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#rsa-sha1"/>
            <Reference URI="#NFe43211014063822000126650010000000021018175250">
                <Transforms>
                    <Transform Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature"/>
                    <Transform Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>
                </Transforms>
                <DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
                <DigestValue>FgnM5JrHimX1/jxXGbKEwWNLh4I=</DigestValue>
            </Reference>
        </SignedInfo>
        <SignatureValue>Vh9JNWoVZ9O/csBN2+TKDTq4/FWBckQWg0WJrTOeUMOIeb1dn5ccEMb02ZVIIuqVnXFqKcVsdkalLDXkDDUpzOn3jZ4KoDjUwO7/xb+hQ3TVQdFyK7t7eUAUmjuuYS+iCQw27fGHDIK5jSDuA93snZMjZ3TmZ4vq62Yc9scarWyqh3bRJvyJC+Sqv96Z7mOnaNpCERuzUcERHrDJU8Al0nc4wQSjm7lDwv85UZlfU0YKUYI79/gTy4kKoGgVgkrZMXpp9JSdfG8z89rAKmxKZkS0eZCapqvWU63SgISUEYu4bA3A7lQDhN1Mp5rfGTrhYqWF+qiGnIajLE2QTk14yw==</SignatureValue>
        <KeyInfo>
            <X509Data>
                <X509Certificate>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</X509Certificate>
            </X509Data>
        </KeyInfo>
    </Signature>
</NFe>
  ''';

  return arquivoXml;
}
