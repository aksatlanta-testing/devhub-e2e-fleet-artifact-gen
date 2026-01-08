
{{- define "go-echoc6c8eeac-5a77-4716-88d3-76aa88b7898a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc6c8eeac-5a77-4716-88d3-76aa88b7898a.fullname" -}}
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


{{- define "go-echoc6c8eeac-5a77-4716-88d3-76aa88b7898a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoc6c8eeac-5a77-4716-88d3-76aa88b7898a.labels" -}}
helm.sh/chart: {{ include "go-echoc6c8eeac-5a77-4716-88d3-76aa88b7898a.chart" . }}
{{ include "go-echoc6c8eeac-5a77-4716-88d3-76aa88b7898a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoc6c8eeac-5a77-4716-88d3-76aa88b7898a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoc6c8eeac-5a77-4716-88d3-76aa88b7898a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}