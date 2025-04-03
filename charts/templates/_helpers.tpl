
{{- define "go-echo568775c3-7e2f-44a6-b614-d2fe3cdaaded.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo568775c3-7e2f-44a6-b614-d2fe3cdaaded.fullname" -}}
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


{{- define "go-echo568775c3-7e2f-44a6-b614-d2fe3cdaaded.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo568775c3-7e2f-44a6-b614-d2fe3cdaaded.labels" -}}
helm.sh/chart: {{ include "go-echo568775c3-7e2f-44a6-b614-d2fe3cdaaded.chart" . }}
{{ include "go-echo568775c3-7e2f-44a6-b614-d2fe3cdaaded.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo568775c3-7e2f-44a6-b614-d2fe3cdaaded.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo568775c3-7e2f-44a6-b614-d2fe3cdaaded.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}