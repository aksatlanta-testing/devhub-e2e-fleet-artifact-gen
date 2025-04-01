
{{- define "go-echob1264d4b-7a69-4a92-8bf6-fd9e8adc487d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1264d4b-7a69-4a92-8bf6-fd9e8adc487d.fullname" -}}
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


{{- define "go-echob1264d4b-7a69-4a92-8bf6-fd9e8adc487d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob1264d4b-7a69-4a92-8bf6-fd9e8adc487d.labels" -}}
helm.sh/chart: {{ include "go-echob1264d4b-7a69-4a92-8bf6-fd9e8adc487d.chart" . }}
{{ include "go-echob1264d4b-7a69-4a92-8bf6-fd9e8adc487d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob1264d4b-7a69-4a92-8bf6-fd9e8adc487d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob1264d4b-7a69-4a92-8bf6-fd9e8adc487d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}