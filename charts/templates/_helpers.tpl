
{{- define "go-echob3f4fae9-3a22-4292-9ee6-31dfc76638ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3f4fae9-3a22-4292-9ee6-31dfc76638ee.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echob3f4fae9-3a22-4292-9ee6-31dfc76638ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob3f4fae9-3a22-4292-9ee6-31dfc76638ee.labels" -}}
helm.sh/chart: {{ include "go-echob3f4fae9-3a22-4292-9ee6-31dfc76638ee.chart" . }}
{{ include "go-echob3f4fae9-3a22-4292-9ee6-31dfc76638ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob3f4fae9-3a22-4292-9ee6-31dfc76638ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob3f4fae9-3a22-4292-9ee6-31dfc76638ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}