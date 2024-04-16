import pandas as pd
import numpy as np

def load_data(file_path):
    try:
        data = pd.read_csv(file_path)
        print("Data loaded successfully.")
        return data
    except Exception as e:
        print(f"Error loading data: {e}")
        return None

def clean_data(df):
    # Trim whitespace from all string fields
    df = df.applymap(lambda x: x.strip() if isinstance(x, str) else x)

    # Convert 'Is' fields to boolean where applicable
    is_columns = [col for col in df.columns if 'Is' in col]
    for column in is_columns:
        df[column] = df[column].apply(lambda x: True if str(x).strip().lower() == 'true' else False if str(x).strip().lower() == 'false' else np.nan)
    
    # Convert date fields
    if 'Last Report Date' in df.columns:
        df['Last Report Date'] = pd.to_datetime(df['Last Report Date'], errors='coerce')

    # Replace missing URLs with empty strings
    url_columns = [col for col in df.columns if 'URL' in col or 'Website' in col]
    df[url_columns] = df[url_columns].fillna('')

    # Handle numeric conversions for latitude and longitude
    if 'Latitude' in df.columns and 'Longitude' in df.columns:
        df[['Latitude', 'Longitude']] = df[['Latitude', 'Longitude']].apply(pd.to_numeric, errors='coerce')

    # Remove duplicate entries
    df.drop_duplicates(inplace=True)

    # Fill NaN for numeric fields after checking types
    numeric_cols = df.select_dtypes(include=[np.number]).columns.tolist()
    df[numeric_cols] = df[numeric_cols].fillna(np.nan)

    return df

def save_cleaned_data(df, output_file_path):
    try:
        df.to_csv(output_file_path, index=False)
        print("Cleaned data saved successfully.")
    except Exception as e:
        print(f"Error saving cleaned data: {e}")

def main():
    input_file_path = 'raw/COVID-19_Treatments_20240416.csv'  
    output_file_path = 'cleaned/cleanedData.csv'  

    data = load_data(input_file_path)
    if data is not None:
        cleaned_data = clean_data(data)
        save_cleaned_data(cleaned_data, output_file_path)

if __name__ == "__main__":
    main()
