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
    """Replaces placeholders in a Word table while preserving formatting (bold, italics, etc.)."""
    for row in table.rows:
        for cell in row.cells:
            for paragraph in cell.paragraphs:
                # Step 1: Rebuild full text from all runs (to detect split placeholders)
                full_text = "".join(run.text for run in paragraph.runs)

                modified_text = full_text  # Copy original text
                replaced = False  # Track if replacement happens

                for key, value in placeholders.items():
                    if key in modified_text:
                        print(f"Replacing {key} with {value}")  # Debugging
                        modified_text = modified_text.replace(key, str(value))
                        replaced = True  # Mark that changes were made
                
                # Step 2: If replacements happened, update runs WITHOUT losing formatting
                if replaced:
                    index = 0  # Track position in modified_text
                    for run in paragraph.runs:
                        run_length = len(run.text)  # Get the original length of this run
                        run.text = modified_text[index: index + run_length]  # Replace only this part
                        index += run_length  # Move to the next part



def generate_reports_doc(report):
    template_path = os.path.join(settings.BASE_DIR, 'Document Format', 'MONTHLY SUMMARY REPORT.docx')

    doc = Document(template_path)

    placeholders = {
        '{{month}}': datetime.now().strftime("%B"),
        '{{year}}': datetime.now().strftime("%Y"),
        
        '(tNSC0)': str(report.totalNSC) if report.totalNSC else '0',
        '(tProd0)': str(report.totalProd) if report.totalProd else '0',
        '(tMeterM0)': str(report.totalMeterMaintenance) if report.totalMeterMaintenance else '0',
        '(tSpecProj0)': str(report.totalSpecialProj) if report.totalSpecialProj else '0',
        '(tConst0)': str(report.totalConstruction) if report.totalConstruction else '0',
        '(tComm0)': str(report.totalCommercial) if report.totalCommercial else '0',
        '(tsales0)': str(report.totalSales) if report.totalSales else '0',
        '(tGenServe0)': str(report.totalGenService) if report.totalGenService else '0',
        '(TotalCons0)': str(report.totalConsumption) if report.totalConsumption else '0',

        '(tNSC1)': str(report.totalNSC1) if report.totalNSC1 else '0',
        '(tProd1)': str(report.totalProd1) if report.totalProd1 else '0',
        '(tMeterM1)': str(report.totalMeterMaintenance1) if report.totalMeterMaintenance1 else '0',
        '(tSpecProj1)': str(report.totalSpecialProj1) if report.totalSpecialProj1 else '0',
        '(tConst1)': str(report.totalConstruction1) if report.totalConstruction1 else '0',
        '(tComm1)': str(report.totalCommercial1) if report.totalCommercial1 else '0',
        '(tsales1)': str(report.totalSales1) if report.totalSales1 else '0',
        '(tGenServe1)': str(report.totalGenService1) if report.totalGenService1 else '0',
        '(TotalCons1)': str(report.totalConsumption1) if report.totalConsumption1 else '0',

        '(tNSC2)': str(report.totalNSC2) if report.totalNSC2 else '0',
        '(tProd2)': str(report.totalProd2) if report.totalProd2 else '0',
        '(tMeterM2)': str(report.totalMeterMaintenance2) if report.totalMeterMaintenance2 else '0',
        '(tSpecProj2)': str(report.totalSpecialProj2) if report.totalSpecialProj2 else '0',
        '(tConst2)': str(report.totalConstruction2) if report.totalConstruction2 else '0',
        '(tComm2)': str(report.totalCommercial2) if report.totalCommercial2 else '0',
        '(tsales2)': str(report.totalSales2) if report.totalSales2 else '0',
        '(tGenServe2)': str(report.totalGenService2) if report.totalGenService2 else '0',
        '(TotalCons2)': str(report.totalConsumption2) if report.totalConsumption2 else '0',

        '(tNSC3)': str(report.totalNSC3) if report.totalNSC3 else '0',
        '(tProd3)': str(report.totalProd3) if report.totalProd3 else '0',
        '(tMeterM3)': str(report.totalMeterMaintenance3) if report.totalMeterMaintenance3 else '0',
        '(tSpecProj3)': str(report.totalSpecialProj3) if report.totalSpecialProj3 else '0',
        '(tConst3)': str(report.totalConstruction3) if report.totalConstruction3 else '0',
        '(tComm3)': str(report.totalCommercial3) if report.totalCommercial3 else '0',
        '(tsales3)': str(report.totalSales3) if report.totalSales3 else '0',
        '(tGenServe3)': str(report.totalGenService3) if report.totalGenService3 else '0',
        '(TotalCons3)': str(report.totalConsumption3) if report.totalConsumption3 else '0',

        '(tNSC4)': str(report.totalNSC4) if report.totalNSC4 else '0',
        '(tProd4)': str(report.totalProd4) if report.totalProd4 else '0',
        '(tMeterM4)': str(report.totalMeterMaintenance4) if report.totalMeterMaintenance4 else '0',
        '(tSpecProj4)': str(report.totalSpecialProj4) if report.totalSpecialProj4 else '0',
        '(tConst4)': str(report.totalConstruction4) if report.totalConstruction4 else '0',
        '(tComm4)': str(report.totalCommercial4) if report.totalCommercial4 else '0',
        '(tsales4)': str(report.totalSales4) if report.totalSales4 else '0',
        '(tGenServe4)': str(report.totalGenService4) if report.totalGenService4 else '0',
        '(TotalCons4)': str(report.totalConsumption4) if report.totalConsumption4 else '0',

        '(tNSC5)': str(report.totalNSC5) if report.totalNSC5 else '0',
        '(tProd5)': str(report.totalProd5) if report.totalProd5 else '0',
        '(tMeterM5)': str(report.totalMeterMaintenance5) if report.totalMeterMaintenance5 else '0',
        '(tSpecProj5)': str(report.totalSpecialProj5) if report.totalSpecialProj5 else '0',
        '(tConst5)': str(report.totalConstruction5) if report.totalConstruction5 else '0',
        '(tComm5)': str(report.totalCommercial5) if report.totalCommercial5 else '0',
        '(tsales5)': str(report.totalSales5) if report.totalSales5 else '0',
        '(tGenServe5)': str(report.totalGenService5) if report.totalGenService5 else '0',
        '(TotalCons5)': str(report.totalConsumption5) if report.totalConsumption5 else '0',
    }

    for table in doc.tables:
        replace_text_in_table(table, placeholders)

    # Save the generated document
    output_dir = os.path.join(settings.MEDIA_ROOT, 'generated_reports')
    os.makedirs(output_dir, exist_ok=True)

    output_path = os.path.join(output_dir, f'sample_report_{datetime.now().strftime("%Y%m%d")}.docx')
    doc.save(output_path)

    # Optionally convert to PDF
    pdf_path = convert_docx_to_pdf(output_path)
    return output_path, pdf_path