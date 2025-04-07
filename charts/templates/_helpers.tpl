
{{- define "go-echoe5b90b92-7ee2-49d1-902e-e57b2ccc1844.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5b90b92-7ee2-49d1-902e-e57b2ccc1844.fullname" -}}
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


{{- define "go-echoe5b90b92-7ee2-49d1-902e-e57b2ccc1844.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe5b90b92-7ee2-49d1-902e-e57b2ccc1844.labels" -}}
helm.sh/chart: {{ include "go-echoe5b90b92-7ee2-49d1-902e-e57b2ccc1844.chart" . }}
{{ include "go-echoe5b90b92-7ee2-49d1-902e-e57b2ccc1844.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe5b90b92-7ee2-49d1-902e-e57b2ccc1844.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe5b90b92-7ee2-49d1-902e-e57b2ccc1844.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}