
{{- define "go-echo42a9400b-8415-4e58-904e-d7916c22c65c.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42a9400b-8415-4e58-904e-d7916c22c65c.fullname" -}}
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


{{- define "go-echo42a9400b-8415-4e58-904e-d7916c22c65c.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo42a9400b-8415-4e58-904e-d7916c22c65c.labels" -}}
helm.sh/chart: {{ include "go-echo42a9400b-8415-4e58-904e-d7916c22c65c.chart" . }}
{{ include "go-echo42a9400b-8415-4e58-904e-d7916c22c65c.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo42a9400b-8415-4e58-904e-d7916c22c65c.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo42a9400b-8415-4e58-904e-d7916c22c65c.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}