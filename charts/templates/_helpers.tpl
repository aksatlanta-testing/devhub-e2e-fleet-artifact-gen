
{{- define "go-echo01ed3baa-e6a5-4b3a-8dd6-fbcf842daf6f.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01ed3baa-e6a5-4b3a-8dd6-fbcf842daf6f.fullname" -}}
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


{{- define "go-echo01ed3baa-e6a5-4b3a-8dd6-fbcf842daf6f.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo01ed3baa-e6a5-4b3a-8dd6-fbcf842daf6f.labels" -}}
helm.sh/chart: {{ include "go-echo01ed3baa-e6a5-4b3a-8dd6-fbcf842daf6f.chart" . }}
{{ include "go-echo01ed3baa-e6a5-4b3a-8dd6-fbcf842daf6f.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo01ed3baa-e6a5-4b3a-8dd6-fbcf842daf6f.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo01ed3baa-e6a5-4b3a-8dd6-fbcf842daf6f.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}