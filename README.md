# Currency

A description of this package.

## ISO 4271 Currency List

### Updating the list

> You will need **gyb** installed on your machine.

After updating the [`Resources/ISO4217.csv`](/Resources/ISO4217.csv) with the latest from the [ISO Currency Workgroup](https://www.currency-iso.org/en/home/tables/table-a1.html),
run the following command:

```bash
find . -name '*.gyb' | \
while read file; do \
    <path to gyb> --line-directive '' -o "${file%.gyb}" "$file"; \
done
```
