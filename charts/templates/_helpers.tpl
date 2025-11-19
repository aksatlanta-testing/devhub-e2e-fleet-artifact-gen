
{{- define "go-echob81919da-e7d7-42a0-8f8c-8448818710cb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob81919da-e7d7-42a0-8f8c-8448818710cb.fullname" -}}
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


{{- define "go-echob81919da-e7d7-42a0-8f8c-8448818710cb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob81919da-e7d7-42a0-8f8c-8448818710cb.labels" -}}
helm.sh/chart: {{ include "go-echob81919da-e7d7-42a0-8f8c-8448818710cb.chart" . }}
{{ include "go-echob81919da-e7d7-42a0-8f8c-8448818710cb.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob81919da-e7d7-42a0-8f8c-8448818710cb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob81919da-e7d7-42a0-8f8c-8448818710cb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}