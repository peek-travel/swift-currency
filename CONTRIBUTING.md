## Legal

By submitting a pull request, you represent that you have the right to license your contribution to the community, and agree by submitting the patch
that your contributions are licensed under the [MIT](https://opensource.org/licenses/MIT) (see [`LICENSE`](../LICENSE)).

## Submitting a Bug

Please ensure to specify the following:

* **SwiftCurrency** commit hash
* Simplest possible steps to reproduce
    * A pull request with a failing test case is preferred, but it's just as fine to write it in the issue description
* Environment Information
  * Locale of device(s)
  * OS version and output of `uname -a`
  * Swift version or output of `swift --version`

## Development

### Git Workflow

`master` is always the development branch.

For **minor** or **patch** SemVer changes, create a branch off of the tagged commit.
  
### Submitting a Pull Request
  
A great PR that is likely to be merged quickly is:
  
1. Concise, with as few changes as needed to achieve the end result.
1. Tested, ensuring that regressions aren't introduced now or in the future.
1. Documented, adding API documentation as needed to cover new functions and properties.
1. Accompanied by a [great commit message](https://chris.beams.io/posts/git-commit/)

### Updating the ISO 4217 Currency List

> You will need [**gyb**](https://github.com/NSHipster/swift-gyb) installed on your machine.

After updating the [`Resources/ISO4217.csv`](/Resources/ISO4217.csv) with the latest from the [ISO Currency Workgroup](https://www.currency-iso.org/en/home/tables/table-a1.html),
run the following command:

```bash
find . -name '*.gyb' | \
while read file; do \
    $(which gyb) --line-directive '' -o "${file%.gyb}" "$file"; \
done
```

# Contributor Conduct

All contributors are expected to adhere to this project's [Code of Conduct](CODE_OF_CONDUCT.md).
