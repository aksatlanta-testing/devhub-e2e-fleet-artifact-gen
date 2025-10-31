
{{- define "go-echoebed3276-9ebe-46c7-bc6e-9dc1c7bbcc00.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebed3276-9ebe-46c7-bc6e-9dc1c7bbcc00.fullname" -}}
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


{{- define "go-echoebed3276-9ebe-46c7-bc6e-9dc1c7bbcc00.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoebed3276-9ebe-46c7-bc6e-9dc1c7bbcc00.labels" -}}
helm.sh/chart: {{ include "go-echoebed3276-9ebe-46c7-bc6e-9dc1c7bbcc00.chart" . }}
{{ include "go-echoebed3276-9ebe-46c7-bc6e-9dc1c7bbcc00.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoebed3276-9ebe-46c7-bc6e-9dc1c7bbcc00.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoebed3276-9ebe-46c7-bc6e-9dc1c7bbcc00.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}