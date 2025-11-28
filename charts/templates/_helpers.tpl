
{{- define "go-echod64440dc-ad39-41eb-9710-7ed25a07280d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod64440dc-ad39-41eb-9710-7ed25a07280d.fullname" -}}
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


{{- define "go-echod64440dc-ad39-41eb-9710-7ed25a07280d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod64440dc-ad39-41eb-9710-7ed25a07280d.labels" -}}
helm.sh/chart: {{ include "go-echod64440dc-ad39-41eb-9710-7ed25a07280d.chart" . }}
{{ include "go-echod64440dc-ad39-41eb-9710-7ed25a07280d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod64440dc-ad39-41eb-9710-7ed25a07280d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod64440dc-ad39-41eb-9710-7ed25a07280d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}