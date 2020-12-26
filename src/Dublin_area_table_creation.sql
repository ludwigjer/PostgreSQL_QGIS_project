DROP TABLE IF EXISTS "dublin_area" CASCADE;

CREATE TABLE "dublin_area" 
("ogc_fid" SERIAL not null PRIMARY KEY,
  "wkb_geometry" geometry,
  "countyname" VARCHAR(254),
  "lat" float8 ,
  "long" float8 ,
  "shape__are" float8 ,
  "shape__len" float8 
);
INSERT INTO "dublin_area" ("wkb_geometry" , "countyname", "lat", "long", "shape__are", "shape__len") VALUES ('0106000020757F00000D000000010300000001000000600000009C44BA60ABE1244138A75AA801AF56411ADA6A0701EF24411A8006ACAEAE56414EC227FCCCF124411299C118D6AC5641529E9D47A9FB244179195EAB42AC5641F0CB4854D80325411DA39BD015AA564148F9EC27F11D25410091B7660CAA564108E9D9D50B1F25417FF5A56FF1A756418CC2D348822925412B1D56359CA656419C1800F5422B2541E0C7E367CEA25641C0B26B9A01082541CC0050C4B3A15641AF52786985072541FC21EB64E5A056419C84124D91072541C6B7EDF9B0A156413A7F143730F524415D39587E7CA05641AAC637788916254193F9257D92A0564137F914FDF7102541363A519BD0A1564141391A075C1925412ABA0DA5A6A15641A1149FCA2B2325410F7074C8A59F564194852BAD3711254126EDFEACC89B5641108A3C8CBE0925411C4A2300CE9B564194B021796A1125414EDC06053F9D56411418BC41B707254103B3F052079E5641945FC5A7C40525411B07F7B9389C5641C07EDBAE68052541E795FE2F429D56416FCAACCA1EEA2441A8CB77BCF49C564106E2386C3D1625418DEE631B979A5641B78EEB4F461D25419350A8D01D96564146105C441D132541EC2D26F4F697564116704FEFD40D2541646D6CF5C597564144A95C8CD6112541DE0DB6699D965641BAE584F5041C2541E9B81AB80795564151FB3B240C362541B98D3A4FB1945641F163C1EE12362541ED0565564B955641BAA0F3C31D4125417F873D2E729456418E5A5BDEB73E2541595202FDDC915641B629BEBA4C2F254146A102C3B9915641C4A14B1061242541B1C997944F945641C20D5F9F651A2541778ADF37A29456415DA51C38F3042541FC0C38780A935641F23C7F876B1E25417D27B3724294564120813E82120625417BDE710F66905641BFD95CEDB0FD244151C553D12D915641C873856FF1042541439C7A97D8925641442AB243ADF6244149C6E1C114915641C9DCE4A981E0244199B8FB2B0291564180BEFC4F17F82441D68BCA07449056413BD225D843E42441F5BC94839C8F5641F6420955EA0B25418F0FB787838F56415431330CFCEB244189ACAA1F868E564124602A38AFF72441E95CA35ABF8B5641C25155033B0C25413DFA10C3718A5641684179C2721725415F4A7DB9648B5641CADF5F18C20F25413D5E19EE888A5641D69AA35EA01825419B6DA1BE3B8A5641C6959A506D1A25411EA2CF35428B5641AE50AACE951925418D287126118A5641071B1603792C2541FEF297A25D885641A76ED32704232541FC1D3FFB6B86564192D3220CAD292541688196145D8156418DB3699A68182541421FA66802805641B0D92811160B254156702FBC51805641963CC33ACFFF2441A4CFFD373F825641DDBFC5FC9AE224419F52435512805641DA522DF813C024411F7630E15D825641FF1DAE9916BD244187B5F4660F7F5641F37F3CD62CB32441C6E5B8613D7D56412C473C437F9C2441BB633DD7B47E56414BFF13D01D9F2441A5734D5B06815641C2E71FF7528D2441FBE43584568056411A4F8290B183244103A945BCD2825641D5C32F31826E2441F43DFE5E0D825641BA6AC8ADC0662441FB002DAC038356417E0300EC244824415F8087285F84564164F9F9094A552441810E0F8A3D86564106764BC3EF3F2441F0A493A2BC875641F1C94262314A24415A55468BFB895641F830394085412441E7EDAE0FBE8A564184C06A58854C244101D46960B58C56411A355F0D9556244183F244B5598C564102B791054C5B2441C03D7CEFE99056417F834FF6E2622441FA10FE25F9905641EEFA7519D76924410909A6B7C89356418873362C147D24413A43E8DEF5965641475888D44A8124413DC9428D8199564168DEE283749F24412A24B681769A5641A0649F4B0C9E2441A6D821120C9C5641E0CC06A65EAA2441D0D9E1BD579F56415453D46D3C732441D31D420FA4A45641DFA1CBFE8A79244152D1F6C1B7A756413E9E048A328A2441588F4D59D9A85641424F582337882441BE365238F1A95641DA8F09D567A024418483AA4511A9564162669D6EF59D2441FF67A31842A85641AA4C021882AB24411D96ABCB4AA8564188E4F12DD7C4244112C1790107AB5641304F4C20DCCA2441290F5083B1AE56419C44BA60ABE1244138A75AA801AF564101030000000100000005000000F6B9655502432541BF2172667C9F5641C650096D57462541C90C882994A056417BF3539351562541388070E724A05641E76437A8D64E25411381F790E89E5641F6B9655502432541BF2172667C9F5641010300000001000000040000002E26C9427636254133802F3BE9965641C012C6F45339254184BA148F55965641A35293788F3325417081099DE59656412E26C9427636254133802F3BE9965641010300000001000000040000009425BF879D2F2541A6CA4E9B46885641106DC98B64322541797C777A1F8856411156C8FFDF312541B944616EDC8756419425BF879D2F2541A6CA4E9B468856410103000000010000000400000010EACC811C2A2541BACD03E4F0A956415DA9D986DC2A25411DB4133232AA56417A1FCCF3732C2541F506E29846AA564110EACC811C2A2541BACD03E4F0A95641010300000001000000040000001C081DD284272541BA35C87083A8564126DA45A93825254167795AEBE9A85641A4A6CF4E80282541CF38898293A856411C081DD284272541BA35C87083A8564101030000000100000004000000E134A5201323254184AC3C27E8A95641629F6355D92225412B9D9FB807AA564194823B705E242541C4B410C421AA5641E134A5201323254184AC3C27E8A9564101030000000100000004000000C5FD970269392541BC6DFF7A069656418D71B073B93825415F9D1CCD0D9656411016199AA939254153C486241E965641C5FD970269392541BC6DFF7A06965641010300000001000000040000008229E8D5F74E254109D35D3282AB56419924039CBB4E2541F3CF067990AB56410E3831BF114F25412DA985C39EAB56418229E8D5F74E254109D35D3282AB56410103000000010000000400000022018EB9084F254122F04F4DA7AB564168AABEC80C4F25419A02FCAAAFAB5641E6723204FB4F2541C9873058ACAB564122018EB9084F254122F04F4DA7AB5641010300000001000000040000000CAEE566BA332541B9EB2672ED965641735DFC4F9C332541B8487F82F5965641C828F2EE0F342541C35D5B78F59656410CAEE566BA332541B9EB2672ED96564101030000000100000004000000CD7D1C317D39254193A22CF3D696564116B4DE88713925415FF0C2B7E096564199A5C99CAA392541E1446A51DE965641CD7D1C317D39254193A22CF3D696564101030000000100000004000000454904D601392541093A36ADEB95564152DB0B9DE4382541F5EE0BCBEE9556415C8E496BF43825410E701785F0955641454904D601392541093A36ADEB955641', 'Dublin', 53.360500000000002, -6.292000000000000, 2612632654.594729900360107, 449433.531827330007218);