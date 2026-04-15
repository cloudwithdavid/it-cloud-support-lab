# KB — Password Reset After Access Loss

> Knowledge Base created in a simulated support lab.

## Purpose

Explain how to handle a single-user account access issue where password reset may be required to restore sign-in access.

## When to Use This KB

Use this KB when a user has been signed out of an account or application and cannot sign back in, and first-line support needs to determine whether password reset is the appropriate response.

## Symptom Pattern

- User was signed out or can no longer access the account
- User cannot sign back in with current credentials
- Issue appears limited to one user
- Root cause is not yet confirmed

## Likely Causes

- User entered the wrong password or forgot it
- Password expired and must be changed
- Account is locked or otherwise restricted
- Sign-in issue is being caused by MFA, session state, or another identity requirement
- Security action or admin action affected account access

## Recommended Checks

1. Confirm exact sign-in symptom and scope
   - Why it matters: Helps separate a general access complaint from a confirmed password-related issue
   - What the result suggests: If the user was signed out and cannot sign back in, continue account access triage before choosing the fix

2. Check account status in the admin portal
   - Why it matters: Confirms whether the account is active and whether first-line support can proceed with reset
   - What the result suggests: If the account is active and eligible for reset, password reset remains in scope. If the account is locked, disabled, or otherwise restricted, a different path may be needed

3. Reset password and revoke active sessions when justified
   - Why it matters: Restores access and clears existing sign-in state that may interfere with successful authentication
   - What the result suggests: If the user can sign in successfully after reset, the issue is resolved. If access still fails, continue identity troubleshooting or escalate based on findings

## Typical Resolution

1. Confirm the issue is a real sign-in access problem affecting one user
2. Verify the account is active and eligible for password reset
3. Reset the password and revoke active sessions
4. Have the user sign in again with the new password

## Verification

- User can sign in successfully with the new password
- Access to the account or application is restored

## Escalate If

- Account is disabled, blocked, or outside first-line reset scope
- Password reset does not restore access
- Findings point to MFA, lockout, conditional access, or another identity control outside the current support boundary

## Notes

This KB is based on a simulated lab case.
The main lesson is that password reset is not the starting assumption. The ticket begins as an account access issue, and the findings determine whether password reset is the right response.
