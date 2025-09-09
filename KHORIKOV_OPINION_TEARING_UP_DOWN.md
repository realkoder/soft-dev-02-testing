# Khorikov’s Take on Setup & Teardown in Tests - by CHATGPT

Vladimir Khorikov (author of *Unit Testing Principles, Practices, and Patterns*) has a strong opinion on *
*setup/teardown** in tests. Here's a summary:

---

## Key Ideas

### 1. Avoid `setup`/`teardown` Methods

- Traditional xUnit frameworks encourage putting initialization in `setup` (`before` in RSpec) and cleanup in
  `teardown` (`after` in RSpec).
- Khorikov argues this makes tests **harder to read and maintain**, because the initial state is hidden.
- Tests should be **understandable in isolation**.

> \"A test should be understandable in isolation. Don’t force readers to jump around the file to understand it.\"

---

### 2. Prefer Explicit Setup in Each Test

- Set up objects inline in each test for **self-contained** tests.
- Yes, this may feel repetitive, but clarity trumps DRY in tests.

---

### 3. Use Builders / Object Mothers Instead of Setup

- If object creation is verbose, use:
    - **Test Data Builders** → small helpers with defaults.
    - **Factory methods** → e.g., `make_user(email: \"x@y.com\")`.
- Keeps setup **explicit and local**, but not noisy.

---

### 4. Teardown is Rarely Needed

- Unit tests usually don’t require teardown.
- Most resources are ephemeral or mocked.
- Integration tests may require cleanup (DB, files), but avoid for unit tests.

---

### 5. Keep Tests Independent

- Shared setup/teardown introduces **hidden coupling**.
- Tests must be independent; order should never matter.

---

## Example in RSpec

❌ **Hidden setup (harder to read)**

```ruby
RSpec.describe User do
  before do
    @user = User.new(\ "Jane\", \"Doe\", \"jane@example.com\")
  end

  it \"returns full name\" do
    expect(@user.full_name).to eq(\"Jane Doe\")
  end
end
```

## ✅ Explicit setup (preferred)

```ruby
RSpec.describe User do
  it \ "returns full name\" do
    user = User.new(\"Jane\", \"Doe\", \"jane@example.com\")
    expect(user.full_name).to eq(\"Jane Doe\")
  end
end
```

## ✅ Using a builder

```ruby

def build_user(overrides = {})
  defaults = { firstname: \ "Jane\", lastname: \"Doe\", email: \"jane@example.com\" }
  User.new(**defaults.merge(overrides))
end

RSpec.describe User do
  it \"returns full name\" do
    user = build_user(firstname: \"Alice\")
    expect(user.full_name).to eq(\"Alice Doe\")
  end
end
```

## Takeaways

Don’t hide setup/teardown in global hooks.

Prefer explicit setup per test.

Extract builders/factories only when repetition is noisy.

Teardown is usually unnecessary in unit tests.