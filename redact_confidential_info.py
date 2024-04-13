import json

fields_to_change = ['sfu_computing_id', 'sfu_email_alias', 'github_username', 'gmail']
file_name = 'about.json'
about_fixtures = json.load(open(file_name, ))
for officer_info in about_fixtures:
    if 'fields' in officer_info and officer_info['model'] == 'about.officer':
        for key in officer_info['fields']:
            if key in fields_to_change:
                officer_info['fields'][key] = (
                    f"{officer_info['fields']['start_date']}_{officer_info['fields']['position_name']}"
                    f"_{officer_info['fields']['full_name']}_{key}"
                ).lower().replace(" ", "_")
            if key == "phone_number":
                officer_info['fields']['phone_number'] = 00000

with open(file_name, 'w+') as f:
    json.dump(about_fixtures, f, indent=4)


file_name = 'django_mailbox.json'
django_mailbox_fixtures = json.load(open(file_name, ))
for entry in django_mailbox_fixtures:
    if entry['model'] == 'django_mailbox.mailbox':
        entry['fields']['uri'] = 'uri'

with open(file_name, 'w+') as f:
    json.dump(django_mailbox_fixtures, f, indent=4)
