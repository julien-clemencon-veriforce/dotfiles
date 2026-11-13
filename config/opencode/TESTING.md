# Unit Test Guidelines

When writing, refactoring, or reviewing unit tests, follow these properties of high-quality tests:

- **Tests observable outcomes, not internal mechanics** — assert on return values, state changes, or side effects visible to the caller; never on which private methods were called or in what order.
- **Mocks only unmanaged dependencies** — external services (email gateways, payment APIs, third-party SDKs) are mocked because you don't control their behavior or availability; managed dependencies (your own database, file system, in-process modules) are used directly or replaced with lightweight fakes.
- **Test descriptions read like domain requirements** — a failing test name tells you what business rule broke, not which method threw. Prefer "Order total includes tax when shipping to a taxable state" over "calculateTotal_returnsTaxedAmount".
- **One logical concept per test** — each test verifies a single behavior or decision branch; a failure points you immediately to the cause without further investigation.
- **Arrange-Act-Assert is clean and obvious** — setup is minimal and relevant; the act is a single, meaningful operation; the assertion is on a concrete, expected value — not just assertNotNull or assertTrue(result > 0).
- **Resilient to refactoring** — renaming a private method, extracting a class, or changing an algorithm's internals should never break a test that was previously passing; only changing what the system does should.
- **No test-specific production code** — no flags, seams, or conditionals added to source code solely to make testing easier; the design is evolved to be naturally testable instead.
- **Fast and deterministic** — runs in milliseconds, produces the same result on every machine regardless of time, environment, or execution order; no flakiness.
- **Avoids over-specification** — asserts only what the test needs to prove; extra assertions on unrelated fields or call counts make the test fragile and obscure intent.
- **Self-contained and independent** — no shared mutable state between tests; each test can run alone or in any order without needing others to have run first.
- **Failure messages are diagnostic** — when a test fails, the output immediately communicates expected vs. actual in domain terms, reducing the time to understand and fix the regression.
