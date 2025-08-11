
{{- define "go-echob5e6ded0-95c8-4502-a5e8-1c998e5304ce.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5e6ded0-95c8-4502-a5e8-1c998e5304ce.fullname" -}}
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


{{- define "go-echob5e6ded0-95c8-4502-a5e8-1c998e5304ce.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob5e6ded0-95c8-4502-a5e8-1c998e5304ce.labels" -}}
helm.sh/chart: {{ include "go-echob5e6ded0-95c8-4502-a5e8-1c998e5304ce.chart" . }}
{{ include "go-echob5e6ded0-95c8-4502-a5e8-1c998e5304ce.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob5e6ded0-95c8-4502-a5e8-1c998e5304ce.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob5e6ded0-95c8-4502-a5e8-1c998e5304ce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}