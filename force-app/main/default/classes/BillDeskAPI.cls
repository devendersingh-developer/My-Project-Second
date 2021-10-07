public class BillDeskAPI {
   public  String  headerdata{get;set;}
    public  BillDeskAPI(){
        system.debug('data ******>>>>>>>> step 1 ');
        headerdata=ApexPages.currentPage().getParameters().get('PaRes');
        system.debug('data ******>>>>>>>> step 2 '+headerdata);
         system.debug('data ******>>>>>>>> step 3 '+ApexPages.currentPage().getParameters().get('msg'));
        
    }
    
    private static String generateHmacSHA256Signature(String saltValue, String secretKeyValue) {
        String algorithmName = 'hmacSHA256';
        Blob hmacData = Crypto.generateMac(algorithmName, Blob.valueOf(saltValue), Blob.valueOf(secretKeyValue));
        return EncodingUtil.convertToHex(hmacData);
    }    
    public static string generateSignature() {
        string sData  = 'AIRINDEMLP|0000145|NA|2.00|CARD|NA|NA|INR|DIRECT|R|airindemlp|NA|NA|F|A1|A2|A3|A4|A5|A6|A7|https://uat.billdesk.com:8443/merchant/BDResponse.jsp';
        String salt = String.valueOf(sData);
        String secretKey = 'WA220V09TwNg';
        String signature = generateHmacSHA256Signature(salt, secretKey);
        System.debug('Signature : ' + signature.toUpperCase());
        return signature.toUpperCase();
    }  
    
    public static void fncCallBillDeskPayment(){
        
        
        List<string> lstCardInfo=BillDeskAPIHelper.fncGetCraditCardInformation();            
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://www.billdesk.com/pgidsk/PGIDirectRequest?reqid=BDRDF011');
        req.setMethod('POST');
        req.setHeader('Content-Type','application/x-www-form-urlencoded');
        
        string str=generateSignature();
        system.debug('check sum ===>>>>>> '+str);
        string sMsg='AIRINDEMLP|0000145|NA|2.00|CARD|NA|NA|INR|DIRECT|R|airindemlp|NA|NA|F|A1|A2|A3|A4|A5|A6|A7|https://uat.billdesk.com:8443/merchant/BDResponse.jsp|'+generateSignature();
        string sIpAddress='59.163.54.19';
        string spaydata=lstCardInfo[0]+'|'+lstCardInfo[1]+'|'+lstCardInfo[2]+'|'+lstCardInfo[3]+'|NA|'+lstCardInfo[4];
        string sUseragent='Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36';
        string   reqBody='msg='+sMsg+'&ipaddress='+sIpAddress+'&paydata='+spaydata+'&useragent='+sUseragent;
        System.debug('payload *********>>>>>>>>> '+reqBody);
        
        req.setBody(reqBody);    
        System.debug('***Request*** >>> '+  reqBody);
        Http http = new Http();
        HTTPResponse res = new HTTPResponse();
        res = http.send(req);
        System.debug(res.getStatusCode()+'***Response*** >>> '+  res.getBody());
        
    }  
    // After that we will have Browser to browser call which is step 2
    
    public static void fncCallBillDeskPaymentstep3(){
       
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://www.billdesk.com/pgidsk/PGIDirectRequest?reqid=BDRDF002');
        req.setMethod('POST');
        req.setHeader('Content-Type','application/x-www-form-urlencoded');
        string sMD='RHMP8074730443';
        string sPaRes='eJy9Wdnzosiyfuev6OjzaPRhdWHC/p0odmQRlEV8ucG+gwqI8NffUnu6e3rm3Dv3PFwjDIukKusjKzO/TNz+61FXn+7xrcvb5utn/J/Y509xE7ZR3qRfP9uW8GXz+VPX+03kV20Tf/3ctJ//9bG1slscc8c4HG7xx1aLu85P40959PXzfx0kzdjgJL0m6PUS+/yxNcAh7l73wrzPv2x8KqISkvoSJuHyC7Wm4y8bMlx9IZfYMsTD1TrAl3DVN0gfENE/iS36+yXc6xZmftN/bP3wysj6B0WSxJraot8ut3V8k7kPhsNeH3jjLdiiP1Yaw3PUQeSPPPrQrPKhcTJhl5luc+lDm0tSK0pSt8DXLfqcsY38Pv4gMJzGMWL1Cad/w4nfSIjqJd9enupA3Q5QN4FhW/RnwRaa6AYtOn2Qy9UW/X61jR8XaNDnki36fbxFf2C7+M0H9tOHwjZQwVO6tU4f2z6vf8ZE/katfqOgrpd8C4+sH7oPb4t+G21D/37/AAAwgBKlyrIZm/KFUo4dHvCn4Px81teUbRzmH9gSgoK/r1WgSttb3mf1E+ofBVv0CQV9HfHH9pinDdzsFn+CTtV0Xz9nfX/5DUXHcfznSP6zvaUotA+GYjQKJ0Rdnv7j83tVHMlN0n5sWb9pmzz0q3z2e3jeWtxnbfTp+4Z/pdI6PLXi6IFnv0C1X0Kcar48JRgJPQn9Cdbf0fYrwFvnf+kyH38qOsRJ/Dy9+JN9kL9+/sf/xZ+5PI27/j9B8Pvubw2OXw3xB8PIZhUvOTyTqI4tEiALixUgdfnewnP8eeYW/Y4ajn+29XezvCdGYpByaiyh07Iu5uiI3SejuU60O0UHcW/ramW2B0rFLa+ZkmvSNYKq7hrSzOLwGPZSM4HLYlHRN43Aloh4Pyd7Wjyx50ft65SSRWm0w+qzMU+ye269YKmVUX32CFOSvYOxv242NTVwtdWYjsWvnGCIAt1bG6w0uwi/ropjubI9RujLCMdpGiwu6Q6IXeCtFnnArTujI6TxqLeXKIgGX7vrbnF1N0U4m66lJK7dmMNNmolyicwnRQksu7RkiGzBe7s152FWfVu2SVe7qZwnHL85s/JFEzZWKFxc47ihLBnHi/we5dWRdjb3U5s2a+MOkM4QJN4t0nNxAiErG7Qb7ceTPFIhj60KQHv7PjibX7++Df+TsbdKPL1P4bTEaM7v/feIjW99nsAAgHlFk2XBK1iW4a8pGGUGpLKpaamz43bnUrwch2u+IwApVBbQmbS8ZmUu0iPGALMTAMc8NLMbWdPjHNMUEX7cOfbM6xroRIDbPJtpvFNWlmnxd43F3rKHVjt1NXtHZhc0hyqsl1kkVvegFjpZ0KuwOV88wk4R86TPAaFfvNPhEhDUQy5AyqS6wwDNEp3zJST49Gzr98DFoRK9kvlqDknnEtRhamL8KGWhrlnpuOdkDIEDmH5t0n0KC/ASfpcVDKodwMilr8eQ+DHijryzt0phpx3kkQcvucyPle25+AUJ+GV2luwHO4PdG5FngbLaa4duFN+2UPjHjvMhcq8WBn9i9mrJD0d3Wfou/+ALYL7XdRbC2hFn5szOKg87aKezxoQvOwFoWqd2Jt89X86umZpNmb7sZrEsOMojZ3o7pT3L2T3UgckzjAk4JE15A3BwgtmycAxNZYZz1R4vxyJfLlXVVyci5oW1wmX0VOzu2aEExHV/vNdHiTkH0WFVe2sXPw7rpEG0TtlfTwffUanW08pYlabLdL3TleCUSov2/iUyMOa6OLkxVx7DhaTY/DVR6rFisTvYKHF9fQTHYzrhGo3c/aHLp6HBuMzdlzzpuqszKeL8wsuEftKKU0WJtLWJS0cUVwvrduziaEj3gTWGBsAJXWOL+h6XZ669TciVuuzWac04O5U/ore+b6exaMasvo7VdT7ua9/kMj/aB8X5cV7eO1GNRXln9NRO607y0ZBQbs2vDCoSJRppE9S0enqlraIdcwmcgdmjewaLV53UqKedEkVD5rmByOFUKGyOY0yQaEZ0LICOAfw9C2JvTFMp10RbRFgWer5pC8wIT0QoR2cGFZOmNyblBcYMR+B5Z186YCHX3lWCLkISDNErGpZFQGB36PBzyIHhuQb5vqj18h+LnCGs6S5gl4R/0jOP4AePoHsohwrwXoWREBYgefqXdNR4kQNuylgJMk4XR81pdt9cQHNWUhqLlji1kPICaK/JB40ByYYHBQCaLClv2YZPQ3lMg82oKLDWYI+iXGcYEklgpU60EDS7eyCO70dw9Qzufg+OdGVCRAF8pLAexxRulnoL+J3E1Ku6syiM+3xzP7jLKSAeHaI2z2AWim82WGlzulQJfTD+9yDvvBl37OlxjyzcfZoDgROGSHQmmE4w36UHzx1Tm3AmiLA4HxkmJPW7R1TvlJM/7nCTnY3xqPecI1a1D58Crj+eT+c74hFvJZZYzREHrLdRbZ7jgPLTqXLQZvvXPXPzsiGMO5ahwCg9k8EB2zOMxyMCmwarTVUkGzG3zDlpb9IlTAHIZ03UuPIZ9JEMzEnjwKimnnCmeA4G9rizQPHTZiw4eCfkuzuQERlNb1f4ZvzRJ8pfs4P6zA6vhMBcV4vZUteNkKnDQVrz3QXZHRN60oa8xnNHc5vTaZWsLrv6CE9itWoIdFzJl+HasXP9UNaohSYUaaTmZeKwsZDqik8iEaxCrtb7QUKqhBW7aVgAyqeBKvDJhWU2Zlb3qxBXVNLacwmFCTR2qR1HPKc6J01DMVkBPcPinpYDnFfjaCVdUUHAkT1zsAhHvlcxg3WTPhDcpWIf+n21zJQ1kYZWZMZTKMp9jlbGYyANZgDmQd4UdroKrLZrVHa94Tbp3C04JOwWclwuT0oSFcyZs8TBmxg5oAq+Wsu325q5XPxDqNBFv87dBqZNO8AsZh+pSSsfTo+BbXb+FGyqU7XZITlxusZkTnh6qPBRAZoVBgn4V3b9S7oVZ0i3YP873R6AnmGexTAo9+BbdRZP7khsnnz05zMc/ZlXNfByFh5hMo11HO3BWUB980lrMcLLnx/qDPrfOWZXvQMJ8g92Pu2GN6Mus4BlLHhNQJ+vYOAIcwgzku++fV47jKP4ZkSOf+iv6JJFh3smGbjoGUzHgKAxjaFOnMXjGudNOgd/i3BE9KqFQnl6Cp90q1neqOPtGFo/4P9d9Mjfgf8n9JAhZfA7+uo7euQn+DuYC3DfXTYyrzPwYBhYYfxS4/ACADDDmxvwvM+mChzz4FbW7BIzF4hY1uZ0JuhSeVzwaNHsKHI3njLxvPah9xq5tjxWLH80CeLqoBUDyFHyPGOT42tUNE1PZ3KBHKjbqhhOMiIJYzHelUnQhFVZM97pHpr+xojWS4HFGzJJ5FvGF4sqCmrYLs4KlhmJN53485W7SFk5NPWdW19nnOFdBVazuu05woFP2ouTJ5WSO+fQu0n5mt2BmIFVbzSl91rWGsmOJUrvuePymqANzZlmkjhTs8x2br40YmazRhqr6qfNHBU50RfrBhALjzRU5bCzyQmXgzC7ilVzuj58X0lKS9W7/HylDWtU/NskLYaa7E/JcqDqoZoPiLh3M8Je2CWlNn2tCWyAqtdd6Ta2Ey9GGaY8wLSUzHSwKAU+NUrjK4cWDJOOQgtswco5bt50BglmROpwEU1jTd5zp3Edjnz6mmwBU0JhbI0wZzLoM8w4sHwnb8C//JGlRMaNGcjhjMbaozx6MqKMHqyibAmkvCsQGfaN5GCGDf/A0aHYX17u8EaWMHAMCpZBZ0C03DHVWm/8kaCxf8PX+Iv0ONP9KaQcyKakOXjkrtO4Kd1fAZUV5xbS7eFFmTDXk2r9JLg/Ue6Tau+v+tDWmZ8Z067pe8R+o2LPT5HU20MuZsWkfpTe6X/gcaud91wJ2ZKivxXsb153nelZoD8VIxH7nUK7gLTpv1PZ/1LYf6de5Gfu/YV6/0SvwPT+QK+CjnJKZQ8qJq/iko2Q8sqRB7I5FVSsaAAT2eNVPMoBycFamR1tAKCPwTKc9hYCTfeZBPbZ49yaoUWzAds2DtsHNZm5VUI0DLJrBt+M26SP9orbF5i3t4q1YfvK3k3GMDjD6nlF3rRazZ16fb7KThO5jzvDHGAnG6bB6Kdco6bgZmqKhDQeMYhmYhQ8TIWgadzY2yXRIjzsnHalkAeKCUxxFo6ST+SEf1uh7WmW9cl/gFPUihjFzoSBGfUKJzMNYS+FMHmwZUQpmBJj3CrRu9RZjTAKVUnDg1I3Tsb4q4LCEt8XBnSV5M16o7SXkl6lUgRkHe+DZ4Wt18htHZj4xe6wRpGy2RTbwykdvGhte3s6JzrdYXF2CZvBTdRexu5OmAqxIMkrttwTKMWljUDVy6FbHRya4v4eGXLtM8zbH70nT3m4dcBQ5q4yC9cW8DMIvT/lZfvZe97+/3pPiQP+770nj/9FWSq8Ivfdc3LyqBcyAX8fe04jkHfP+RJisLh76AU/wZ7zD/D/LnrkPwiwf4se+RU+rBDzX2MFGvsVK9wInvcV0D7jhr079NKV6lVG1OyjYhMVEehOMihWsDZ52PccFmCoUUdFRmx28om7dnvLkCTiqu4K7KYnjtydJQaUFF9dhHXHGWN3OOx5d4GbyiZAYNeprMkVcTOUVMJTlC/PqSETGSWRhjNTs3TvpY3fOtUYOeeri6vHtZcK9XQZCfIwjJmHbvDrymbn6YYhlrFc0+dDlPFEu6lZgxipytjRcxgubBK7XQmanvbyPFc38iGs5+NQ9ILb+Q3dead8FCOUqVul1dyBu8gIWlKLVulEMa6sDQV7ggXW3+eNYgh2uj+OHRArrLKvG1lVLnFse/lZbEnmoa/X/UIf+wgt6ioXYEoS5w4RpQdzT3w1OsUrb0fwS5TqQQobMSAWZgHPC2xefQE/PnnMFDTwatLeryoOmPHmOZODlCUiGvPyk4hLTRcSmbOXNcOYRjTktHi2gwVDjSmlJ1w//0U4vcocHpxQgUlOjxBh1fJG6e7xgF6ak2Jb46hl9dRruR0Yrk3u0KsD+trQyRPfVm54mNljh2GHLvQpRhY7rm03Xj+VqyS2XcQTdMrQ2LvgGWSBy/NOxctymQw5mgSikvVhYJAqk5gR61xodHkzdseFZfdMwa/zkOaKkt3N5oac14vLjMylq3TKeYdiD7o5ifJD8qJS6KL1ndToxZr2FPcRZ+cHdghMyM2bQKxPxGqZ7M+XUR3tjWh7fH0EBCYyA+KZ/looFS00wnGx4ILzVQMgIGtVvx5OK0bMMfzacBhNmo6INj7agnazBFy9WydoxpLxkMtNlTGP1aT2CElv5kZDi5u/2uPyurZw8S5c1PRkeBI3fv2r/gD98WYO/f627sd7vNcfCq+/PZ4vwX/+O+S/ATFcRG8=';
        List<string> lstCardInfo=BillDeskAPIHelper.fncGetCraditCardInformation();
        string spaydata=lstCardInfo[0]+'|'+lstCardInfo[1]+'|'+lstCardInfo[2]+'|'+lstCardInfo[3]+'|NA|'+lstCardInfo[4];
        string  sTermUrl='http://dev-igtsolutions.cs5.force.com/liveagent/VFBillDesk';
        string   reqBody='MD='+sMD+'&paydata='+spaydata+'&PaRes='+EncodingUtil.urlEncode(sPaRes, 'UTF-8');
        System.debug('payload *********>>>>>>>>> '+reqBody);
        req.setBody(reqBody);    
        System.debug('*** step 3 Request*** >>> '+  reqBody);
        Http http = new Http();
        HTTPResponse res = new HTTPResponse();
        res = http.send(req);
        System.debug(res.getStatusCode()+'*** step 4 Response*** >>> '+  res.getBody());    
    }  
}