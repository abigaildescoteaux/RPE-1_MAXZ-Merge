input = getDirectory("[insert path of input directory with projected images here]");
output = getDirectory("[insert path of output directory for Merged images here]")

list=getFileList(input);
Array.sort(list);
setBatchMode(true);

//create the arrays
DAPI = newArray(0);
Cilia = newArray(0);

//get channel names
for (i = 0; i < list.length; i++) {
   file = list[i];
   if (endsWith(file, "DAPI.tif")) {DAPI = Array.concat(DAPI, file);} 
         else if (endsWith(file, "Cilia.tif")) {Cilia = Array.concat(Cilia, file);}
   } 

// Loop over the images
for (i = 0; i < DAPI.length; i++) {
   DAPIChannel = DAPI[i];
   CiliaChannel = Cilia[i];
   open(input+DAPIChannel);
   open(input+CiliaChannel);
   run("Merge Channels...", "c1=&CiliaChannel c3=&DAPIChannel create");
   fileName = replace(DAPIChannel, "_DAPI.tif", "") + "_Composite";
   saveAs("tiff", output + fileName);
   run("Close All");
}

setBatchMode(false);
print("Done");
