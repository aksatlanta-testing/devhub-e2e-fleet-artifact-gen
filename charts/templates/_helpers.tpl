
{{- define "go-echofffe2232-2464-4b32-bad9-3efcae018595.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofffe2232-2464-4b32-bad9-3efcae018595.fullname" -}}
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


{{- define "go-echofffe2232-2464-4b32-bad9-3efcae018595.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echofffe2232-2464-4b32-bad9-3efcae018595.labels" -}}
helm.sh/chart: {{ include "go-echofffe2232-2464-4b32-bad9-3efcae018595.chart" . }}
{{ include "go-echofffe2232-2464-4b32-bad9-3efcae018595.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echofffe2232-2464-4b32-bad9-3efcae018595.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echofffe2232-2464-4b32-bad9-3efcae018595.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}