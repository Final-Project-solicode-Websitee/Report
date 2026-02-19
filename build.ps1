# Pandoc Build Script
# This script converts the modular Markdown files into a professional Report.

$outputDocx = "Final_Report.docx"
$outputPdf = "Final_Report.pdf"

$metadata = "metadata.yaml"
$inputFiles = "01_remerciement_intro.md", 
"02_contexte_methodologie.md", 
"03_analyse_fonctionnelle.md", 
"04_technical_branch.md", 
"05_design_realisation.md", 
"06_conclusion.md"

Write-Host "--- Starting Professional Pandoc Build ---" -ForegroundColor Cyan

# Build DOCX with Table of Contents and Section Numbering
Write-Host "Generating DOCX: $outputDocx..."
pandoc $metadata $inputFiles `
    --toc `
    --number-sections `
    -o $outputDocx

if ($LASTEXITCODE -eq 0) {
    Write-Host "DOCX SUCCESS: $outputDocx created." -ForegroundColor Green
}

# Build PDF (requires a PDF engine like wkhtmltopdf or MiKTeX)
Write-Host "Generating PDF: $outputPdf..."
pandoc $metadata $inputFiles `
    --toc `
    --number-sections `
    --pdf-engine=xelatex `
    -o $outputPdf

if ($LASTEXITCODE -eq 0) {
    Write-Host "PDF SUCCESS: $outputPdf created." -ForegroundColor Green
}
else {
    Write-Host "PDF WARNING: PDF engine not found or failed. Ensure MiKTeX or wkhtmltopdf is installed." -ForegroundColor Yellow
}

Write-Host "--- Build Complete ---" -ForegroundColor Cyan
