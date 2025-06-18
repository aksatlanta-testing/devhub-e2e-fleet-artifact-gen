
{{- define "go-echoa091fada-00b9-4034-bbff-bf73f6b0906c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa091fada-00b9-4034-bbff-bf73f6b0906c.fullname" -}}
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


{{- define "go-echoa091fada-00b9-4034-bbff-bf73f6b0906c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa091fada-00b9-4034-bbff-bf73f6b0906c.labels" -}}
helm.sh/chart: {{ include "go-echoa091fada-00b9-4034-bbff-bf73f6b0906c.chart" . }}
{{ include "go-echoa091fada-00b9-4034-bbff-bf73f6b0906c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa091fada-00b9-4034-bbff-bf73f6b0906c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa091fada-00b9-4034-bbff-bf73f6b0906c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}