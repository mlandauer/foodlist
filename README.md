# README

Show what I've bought at the Blue Mountains Food Coop

## Usage

First do a csv export from the esuite (http://www.esuite.com.au/) software. Let's say the resulting
file is called `sales_summary.csv`.

To load that data use the [upload form](http://localhost:3000/uploads/new)

Any user can register. However to see their receipts, the user needs to be manually connected
to their account. At the moment the easiest way to do this is using the rails console.

```
bundle exec rails c
> User.find_by_email("matthew@oaf.org.au").update_attributes(account: Account.find_by_ref("SZUM01"))
```

This hooks up the user with email address "matthew@oaf.org.au" to the member with reference "SZUM01"

## License

Copyright Matthew Landauer

Licensed under Affero GPL V3
