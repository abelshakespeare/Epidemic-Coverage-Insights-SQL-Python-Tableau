CREATE TEMP TABLE tmp_csv_data (
    provider_name TEXT,
    address1 TEXT,
    address2 TEXT,
    city TEXT,
    state TEXT,
    zip TEXT,
    public_phone_number TEXT,
    public_website TEXT,
    latitude FLOAT,
    longitude FLOAT,
    geopoint TEXT,
    last_report_date TIMESTAMP WITH TIME ZONE,
    is_pap_site BOOLEAN,
    is_telehealth_site BOOLEAN,
    telehealth_website TEXT,
    pharmacist_prescribing BOOLEAN,
    home_delivery BOOLEAN,
    home_delivery_url TEXT,
    is_t2t_site BOOLEAN,
    is_icatt_site BOOLEAN,
    has_usg_product BOOLEAN,
    has_commercial_product BOOLEAN,
    has_paxlovid BOOLEAN,
    has_commercial_paxlovid BOOLEAN,
    has_usg_paxlovid BOOLEAN,
    has_lagevrio BOOLEAN,
    has_commercial_lagevrio BOOLEAN,
    has_usg_lagevrio BOOLEAN,
    has_veklury BOOLEAN,
    grantee_code TEXT,
    provider_note TEXT
);


-- Adjust the path to the location of your CSV file
COPY tmp_csv_data FROM '/Users/abelshakespeare/Documents/GitHub/Epidemic-Coverage-Insights-SQL-Python-Tableau/data/cleaned/cleanedData.csv' DELIMITER ',' CSV HEADER QUOTE '"';

-- Using a DO block to perform operations with stored procedures logic

DO $$
DECLARE
    _provider_id INT;
    r record;  -- Declare r as a record to hold row data
BEGIN
    FOR r IN SELECT * FROM tmp_csv_data LOOP
        -- Insert into provider_info and capture the provider_id
        INSERT INTO provider_info (provider_name, public_phone_number, public_website)
        VALUES (r.provider_name, r.public_phone_number, r.public_website)
        RETURNING provider_id INTO _provider_id;

        -- Insert into provider_location using the captured provider_id
        INSERT INTO provider_location (provider_id, address1, address2, city, state, zip, latitude, longitude, geopoint)
        VALUES (_provider_id, r.address1, r.address2, r.city, r.state, r.zip, r.latitude, r.longitude, r.geopoint);

        -- Insert into provider_services using the captured provider_id
        INSERT INTO provider_services (provider_id, is_pap_site, is_telehealth_site, telehealth_website, pharmacist_prescribing, home_delivery, home_delivery_url, is_t2t_site, is_icatt_site)
        VALUES (_provider_id, r.is_pap_site, r.is_telehealth_site, r.telehealth_website, r.pharmacist_prescribing, r.home_delivery, r.home_delivery_url, r.is_t2t_site, r.is_icatt_site);

        -- Insert into product_availability using the captured provider_id
        INSERT INTO product_availability (provider_id, has_usg_product, has_commercial_product, has_paxlovid, has_commercial_paxlovid, has_usg_paxlovid, has_lagevrio, has_commercial_lagevrio, has_usg_lagevrio, has_veklury, grantee_code, provider_note)
        VALUES (_provider_id, r.has_usg_product, r.has_commercial_product, r.has_paxlovid, r.has_commercial_paxlovid, r.has_usg_paxlovid, r.has_lagevrio, r.has_commercial_lagevrio, r.has_usg_lagevrio, r.has_veklury, r.grantee_code, r.provider_note);
    END LOOP;
END $$;


-- Drop the temporary table after use
DROP TABLE tmp_csv_data;
