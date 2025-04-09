
{{- define "go-echob14eb627-a280-4fde-b718-c76998e7ad0b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob14eb627-a280-4fde-b718-c76998e7ad0b.fullname" -}}
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


{{- define "go-echob14eb627-a280-4fde-b718-c76998e7ad0b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob14eb627-a280-4fde-b718-c76998e7ad0b.labels" -}}
helm.sh/chart: {{ include "go-echob14eb627-a280-4fde-b718-c76998e7ad0b.chart" . }}
{{ include "go-echob14eb627-a280-4fde-b718-c76998e7ad0b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob14eb627-a280-4fde-b718-c76998e7ad0b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob14eb627-a280-4fde-b718-c76998e7ad0b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}