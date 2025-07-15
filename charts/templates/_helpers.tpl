
{{- define "go-echo763b96ef-612a-491e-a7a7-69be09eda845.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo763b96ef-612a-491e-a7a7-69be09eda845.fullname" -}}
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


{{- define "go-echo763b96ef-612a-491e-a7a7-69be09eda845.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo763b96ef-612a-491e-a7a7-69be09eda845.labels" -}}
helm.sh/chart: {{ include "go-echo763b96ef-612a-491e-a7a7-69be09eda845.chart" . }}
{{ include "go-echo763b96ef-612a-491e-a7a7-69be09eda845.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo763b96ef-612a-491e-a7a7-69be09eda845.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo763b96ef-612a-491e-a7a7-69be09eda845.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}