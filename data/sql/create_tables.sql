-- Create Provider Information Table
CREATE TABLE provider_info (
    provider_id SERIAL PRIMARY KEY,
    provider_name TEXT,
    public_phone_number TEXT,
    public_website TEXT
);

-- Create Provider Location Table
CREATE TABLE provider_location (
    location_id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES provider_info(provider_id),
    address1 TEXT,
    address2 TEXT,
    city TEXT,
    state TEXT,
    zip TEXT,
    latitude FLOAT,
    longitude FLOAT,
    geopoint TEXT
);

-- Create Provider Services Table
CREATE TABLE provider_services (
    service_id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES provider_info(provider_id),
    is_pap_site BOOLEAN,
    is_telehealth_site BOOLEAN,
    telehealth_website TEXT,
    pharmacist_prescribing BOOLEAN,
    home_delivery BOOLEAN,
    home_delivery_url TEXT,
    is_t2t_site BOOLEAN,
    is_icatt_site BOOLEAN
);

-- Create Product Availability Table
CREATE TABLE product_availability (
    product_id SERIAL PRIMARY KEY,
    provider_id INT REFERENCES provider_info(provider_id),
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
