import csv

# Path to the input CSV file
input_file_path = '/Users/abelshakespeare/Documents/GitHub/Epidemic-Coverage-Insights-SQL-Python-Tableau/data/raw/uszips.csv'
# Path to the output CSV file
output_file_path = '/Users/abelshakespeare/Documents/GitHub/Epidemic-Coverage-Insights-SQL-Python-Tableau/data/processed/uszipsProcessed.csv'

# Urban density threshold
urban_density_threshold = 1000

# Function to determine if the area is urban based on the density
def is_urban(density):
    try:
        if float(density) >= urban_density_threshold:
            return 'TRUE'
        else:
            return 'FALSE'
    except ValueError:
        return 'FALSE'  # Default to FALSE if density is not a number

# Open the input CSV file and read from it
with open(input_file_path, mode='r', newline='', encoding='utf-8') as file:
    reader = csv.DictReader(file)

    # Field names for the output CSV file
    fieldnames = ['zip', 'is_urban']

    # Open the output CSV file and prepare to write to it
    with open(output_file_path, mode='w', newline='', encoding='utf-8') as output_file:
        writer = csv.DictWriter(output_file, fieldnames=fieldnames)
        writer.writeheader()

        # Process each row in the input CSV
        for row in reader:
            zip_code = row['zip']
            density = row['density']
            # Determine if the location is urban
            urban_status = is_urban(density)

            # Write the result to the output CSV file
            writer.writerow({'zip': zip_code, 'is_urban': urban_status})

print("CSV processing complete. Output saved to:", output_file_path)
