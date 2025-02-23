from docx import Document
from django.conf import settings
import os
import pythoncom
from docx2pdf import convert
from datetime import datetime

def convert_docx_to_pdf(docx_path):
    pythoncom.CoInitialize()
    try:
        # Define the output path for the PDF
        pdf_output_path = docx_path.replace('.docx', '.pdf')
        
        # Perform the conversion
        convert(docx_path, pdf_output_path)
        
        # for debugging
        print(f"DOCX Path: {docx_path}")
        print(f"PDF Path: {pdf_output_path}")
        
        return pdf_output_path
    finally:
        pythoncom.CoUninitialize()

def replace_text_in_table(table, placeholders):
    """Replaces placeholders in all cells of a table."""
    for row in table.rows:
        for cell in row.cells:
            for key, value in placeholders.items():
                cell.text = cell.text.replace(str(key), str(value) or '')

def generate_reports_doc(report):
    template_path = os.path.join(settings.BASE_DIR, 'Document Format', 'MONTHLY SUMMARY REPORT.docx')

    doc = Document(template_path)

    placeholders = {
        '{{tNSC}}': report.totalNSC,
        '{{tProd}}':report.totalProd,
        '{{tMeterM}}':report.totalMeterMaintenance,
        '{{tSpecProj}}':report.totalSpecialProj,
        '{{tConstruct}}':report.totalConstruction,
        '{{tComm}}':report.totalCommercial,
        '{{tsales}}':report.totalSales,
        '{{tGenServe}}':report.totalGenService,
        '{{totalCons}}':report.totalConsumption
    }

    for table in doc.tables:
        replace_text_in_table(table, placeholders)

    # Save the generated document
    output_dir = os.path.join(settings.MEDIA_ROOT, 'generated_proposals')
    os.makedirs(output_dir, exist_ok=True)

    output_path = os.path.join(output_dir, f'sample_report_{datetime.now().strftime("%Y%m%d")}.docx')
    doc.save(output_path)