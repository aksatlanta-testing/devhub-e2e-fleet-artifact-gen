
{{- define "go-echo949c05f2-140f-4ef9-8969-fd2e00df91ff.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo949c05f2-140f-4ef9-8969-fd2e00df91ff.fullname" -}}
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


{{- define "go-echo949c05f2-140f-4ef9-8969-fd2e00df91ff.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo949c05f2-140f-4ef9-8969-fd2e00df91ff.labels" -}}
helm.sh/chart: {{ include "go-echo949c05f2-140f-4ef9-8969-fd2e00df91ff.chart" . }}
{{ include "go-echo949c05f2-140f-4ef9-8969-fd2e00df91ff.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo949c05f2-140f-4ef9-8969-fd2e00df91ff.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo949c05f2-140f-4ef9-8969-fd2e00df91ff.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}