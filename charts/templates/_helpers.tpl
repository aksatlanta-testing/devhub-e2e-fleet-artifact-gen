
{{- define "go-echodfdfd8a3-ffba-4a82-b6df-f93fd3f6db24.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfdfd8a3-ffba-4a82-b6df-f93fd3f6db24.fullname" -}}
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


{{- define "go-echodfdfd8a3-ffba-4a82-b6df-f93fd3f6db24.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echodfdfd8a3-ffba-4a82-b6df-f93fd3f6db24.labels" -}}
helm.sh/chart: {{ include "go-echodfdfd8a3-ffba-4a82-b6df-f93fd3f6db24.chart" . }}
{{ include "go-echodfdfd8a3-ffba-4a82-b6df-f93fd3f6db24.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echodfdfd8a3-ffba-4a82-b6df-f93fd3f6db24.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echodfdfd8a3-ffba-4a82-b6df-f93fd3f6db24.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}