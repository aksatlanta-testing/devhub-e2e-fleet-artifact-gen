
{{- define "go-echo2e9e7e8b-b245-4816-9934-43092334e8ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2e9e7e8b-b245-4816-9934-43092334e8ee.fullname" -}}
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


{{- define "go-echo2e9e7e8b-b245-4816-9934-43092334e8ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo2e9e7e8b-b245-4816-9934-43092334e8ee.labels" -}}
helm.sh/chart: {{ include "go-echo2e9e7e8b-b245-4816-9934-43092334e8ee.chart" . }}
{{ include "go-echo2e9e7e8b-b245-4816-9934-43092334e8ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo2e9e7e8b-b245-4816-9934-43092334e8ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo2e9e7e8b-b245-4816-9934-43092334e8ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}