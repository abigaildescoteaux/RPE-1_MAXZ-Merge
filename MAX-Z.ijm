inputDir = getDirectory("[insert path of input directory with raw images here]");
outputDir=getDirectory("[insert path of output directory for projected images here]");
listdir=getFileList(inputDir);
for(i=0; i<listdir.length; i++) {
	path = inputDir+listdir[i];
	setBatchMode(true);
	open(path);
	run("Z Project...", "projection=[Max Intensity]");
	name = File.nameWithoutExtension;
	if (matches(name, ".*w2561 w 605 emitt.*")) {
		newname1=replace(name,"w2561 w 605 emitt","Cilia");
		saveAs("Tiff", outputDir+newname1);
			close();
	} if (matches(name, ".*w1405.*")) {
		newname2=replace(name,"w1405","DAPI");
		saveAs("Tiff", outputDir+newname2);
			close();
	}
}
