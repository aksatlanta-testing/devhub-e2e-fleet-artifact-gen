
{{- define "go-echob6ff3680-27d4-40b7-9fac-2e2cde439f8e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob6ff3680-27d4-40b7-9fac-2e2cde439f8e.fullname" -}}
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


{{- define "go-echob6ff3680-27d4-40b7-9fac-2e2cde439f8e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob6ff3680-27d4-40b7-9fac-2e2cde439f8e.labels" -}}
helm.sh/chart: {{ include "go-echob6ff3680-27d4-40b7-9fac-2e2cde439f8e.chart" . }}
{{ include "go-echob6ff3680-27d4-40b7-9fac-2e2cde439f8e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob6ff3680-27d4-40b7-9fac-2e2cde439f8e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob6ff3680-27d4-40b7-9fac-2e2cde439f8e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}