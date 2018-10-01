# ---------------------
# Function to generate a pdf file from a tex file
function gentex
   if test -z $argv
      echo "Please provide tex file basename (exclude the '.tex' extension)"
   end

   set base_filename $argv[1]

   if test -f $base_filename.tex
      echo "Generating pdf for $base_filename.tex"
      latex  $base_filename.tex
      latex  $base_filename.tex
      dvips  $base_filename.dvi
      ps2pdf $base_filename.ps
   else
      echo "Couldn't find file $base_filename.tex"
   end
end
